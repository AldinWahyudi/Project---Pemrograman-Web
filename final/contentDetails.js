document.addEventListener("DOMContentLoaded", async () => {
  const params = new URLSearchParams(window.location.search);
  const id = params.get("id");
  if (!id) return;

  // Ambil semua produk
  const res = await fetch("get_produk.php");
  const data = await res.json();

  const product = data.find((p) => p.id == id);
  if (!product) return;

  // Tampilkan produk utama
  document.getElementById("product-img").src = product.image;
  document.getElementById("product-title").textContent = product.name;
  document.getElementById("product-brand").textContent = product.brand;
  document.getElementById("product-price").textContent = "Rp " + Number(product.price).toLocaleString("id-ID");
  document.getElementById("product-description").textContent = product.brand;

  // Thumbnail gallery
  const gallery = document.getElementById("product-gallery");
  const thumb = document.createElement("img");
  thumb.src = product.image;
  gallery.appendChild(thumb);

  // Qty control
  const qtyInput = document.getElementById("qty");
  let qty = 1;
  document.getElementById("plus").onclick = () => qtyInput.value = ++qty;
  document.getElementById("minus").onclick = () => {
    if (qty > 1) qtyInput.value = --qty;
  };

  // Fungsi tambah ke cart
  const addToCart = (showAlert = false) => {
    let cart = JSON.parse(localStorage.getItem("cart")) || [];
    const existing = cart.find((item) => item.id == product.id);

    if (existing) {
      existing.qty += qty;
    } else {
      cart.push({
        id: product.id,
        name: product.name,
        price: product.price,
        qty: qty,
        image: product.image
      });
    }

    localStorage.setItem("cart", JSON.stringify(cart));
    if (showAlert) alert("Produk berhasil dimasukkan ke keranjang!");
  };

  document.querySelector(".cart-btn").onclick = () => addToCart(true);
  document.querySelector(".buy-btn").onclick = () => {
    addToCart(false);
    window.location.href = "cart.php";
  };

  // Rekomendasi produk lainnya
  const recommendationContainer = document.getElementById("recommendation-list");
  data.forEach((item) => {
    if (item.id != product.id) {
      const card = document.createElement("div");
      card.className = "recommendation-item";
      card.innerHTML = `
        <a href="contentDetails.html?id=${item.id}">
          <img src="${item.image}" alt="${item.name}" />
          <h4>${item.name}</h4>
          <p>Rp ${Number(item.price).toLocaleString("id-ID")}</p>
        </a>`;
      recommendationContainer.appendChild(card);
    }
  });
});
