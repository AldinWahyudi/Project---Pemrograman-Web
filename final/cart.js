let cart = JSON.parse(localStorage.getItem("cart")) || [];

const cartContainer = document.getElementById("cartContainer");
const totalContainer = document.getElementById("totalContainer");

function renderCart() {
  cartContainer.innerHTML = "";
  totalContainer.innerHTML = "";

  cart.forEach((product, index) => {
    const box = document.createElement("div");
    box.className = "card mb-3 p-3 shadow-sm";

    // Logika penanganan gambar yang lebih fleksibel dari cart.js
    const imageUrl = product.image || product.preview || "https://via.placeholder.com/100";

    box.innerHTML = `
      <div class="d-flex align-items-center">
        <input type="checkbox" class="form-check-input me-3 checkout-check" data-index="${index}" checked />
        <img src="${imageUrl}" class="rounded me-3" style="width:80px;height:80px;object-fit:cover" />
        <div>
          <h5 class="mb-1">${product.name} × ${product.qty}</h5>
          <p class="mb-1">Amount: <strong>Rp ${product.price.toLocaleString("id-ID")}</strong></p>
        </div>
        <div class="ms-auto d-flex align-items-center gap-2">
          <button class="btn btn-outline-secondary btn-sm" onclick="changeQty(${index}, -1)">−</button>
          <span>${product.qty}</span>
          <button class="btn btn-outline-secondary btn-sm" onclick="changeQty(${index}, 1)">+</button>
          <button class="btn btn-danger btn-sm" onclick="removeItem(${index})">🗑️ Hapus</button>
        </div>
      </div>
    `;

    cartContainer.appendChild(box);
  });

  document.querySelectorAll(".checkout-check").forEach(check => {
    check.addEventListener("change", updateTotal);
  });

  updateTotal();
}

function changeQty(index, amount) {
  cart[index].qty += amount;
  if (cart[index].qty < 1) cart[index].qty = 1;
  localStorage.setItem("cart", JSON.stringify(cart));
  renderCart();
}

function removeItem(index) {
  cart.splice(index, 1);
  localStorage.setItem("cart", JSON.stringify(cart));
  renderCart();
}

function updateTotal() {
  let totalAmount = 0;
  let totalItems = 0;
  let formItems = "";

  const checks = document.querySelectorAll(".checkout-check");
  checks.forEach((check, i) => {
    const p = cart[i];
    if (check.checked && p) {
      totalAmount += p.price * p.qty;
      totalItems += p.qty;
      formItems += `<input type="hidden" name="item${i}" value="${p.name} × ${p.qty}" />`;
    }
  });

  if (totalItems === 0) {
    totalContainer.innerHTML = `
      <div class="card p-4 mt-4 shadow-sm">
        <p class="text-danger"><strong>❗ Tidak ada item dipilih.</strong></p>
      </div>
    `;
    return;
  }

  totalContainer.innerHTML = `
    <div class="card p-4 mt-4 shadow-sm">
      <h4 class="mb-3">Total Items: <strong>${totalItems}</strong></h4>
      <h4 class="mb-4">Total Amount: <strong>Rp ${totalAmount.toLocaleString("id-ID")}</strong></h4>

      <form action="proses_order.php" method="post" onsubmit="return checkoutValidation(event)">
        <div class="mb-3">
          <label for="payment_method" class="form-label">Metode Pembayaran</label>
          <select name="payment_method" id="payment_method" class="form-select" required>
            <option value="">-- Pilih --</option>
            <option value="COD">COD (Bayar di Tempat)</option>
            <option value="Bank Transfer">Transfer Bank</option>
            <option value="E-Wallet">E-Wallet (OVO/Dana/Gopay)</option>
          </select>
        </div>

        <div class="mb-3">
          <label for="shipping_address" class="form-label">Alamat Pengiriman</label>
          <textarea name="shipping_address" id="shipping_address" class="form-control" rows="3" placeholder="Masukkan alamat lengkap..." required></textarea>
        </div>

        <input type="hidden" name="totalItems" value="${totalItems}" />
        <input type="hidden" name="totalAmount" value="${totalAmount}" />
        ${formItems}

        <button type="submit" class="btn btn-primary">Checkout</button>
      </form>
    </div>
  `;
}

function checkoutValidation(event) {
  const checked = document.querySelectorAll(".checkout-check:checked");
  if (checked.length === 0) {
    event.preventDefault();
    alert("❗ Silakan pilih minimal satu item untuk checkout.");
    return false;
  }
  return true;
}

renderCart();