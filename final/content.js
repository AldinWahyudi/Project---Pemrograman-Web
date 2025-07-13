document.addEventListener("DOMContentLoaded", function () {
  const productList = document.getElementById("product-list");

  if (!productList) {
    console.error("Elemen #product-list tidak ditemukan!");
    return;
  }

  function formatPrice(price) {
    return "Rp " + Number(price).toLocaleString("id-ID");
  }

  function createProductCard(item) {
    const col = document.createElement("div");
    col.className = "product-card";

    const link = document.createElement("a");
    link.href = `contentDetails.html?id=${item.id}`;
    link.style.textDecoration = "none";
    link.style.color = "inherit";

    const card = document.createElement("div");
    card.className = "card h-100";
    card.style.cursor = "pointer";

    const img = document.createElement("img");
    img.src = item.image;
    img.className = "card-img-top";
    img.alt = item.name;

    img.onerror = function () {
      this.src = 'https://via.placeholder.com/200x200/cccccc/666666?text=No+Image';
    };

    const cardBody = document.createElement("div");
    cardBody.className = "card-body text-center";

    const name = document.createElement("h5");
    name.className = "card-title";
    name.textContent = item.name;

    const brand = document.createElement("p");
    brand.className = "card-text text-muted mb-1";
    brand.textContent = item.brand;

    const price = document.createElement("p");
    price.className = "card-text text-primary fw-bold";
    price.textContent = formatPrice(item.price);

    cardBody.appendChild(name);
    cardBody.appendChild(brand);
    cardBody.appendChild(price);

    card.appendChild(img);
    card.appendChild(cardBody);
    link.appendChild(card);
    col.appendChild(link);

    return col;
  }

  fetch('get_produk.php')
    .then(response => {
      if (!response.ok) {
        throw new Error(`HTTP error! status: ${response.status}`);
      }
      return response.text();
    })
    .then(text => {
      try {
        const data = JSON.parse(text);
        productList.innerHTML = "";

        if (Array.isArray(data) && data.length > 0) {
          data.forEach(item => {
            const productCard = createProductCard(item);
            productList.appendChild(productCard);
          });
        }
      } catch (e) {
        console.error("Error parsing JSON:", e);
        throw new Error("Invalid JSON response");
      }
    })
    .catch(error => {
      console.error("Error detail:", error);
    });

  // Tombol scroll horizontal
  document.getElementById("scrollLeft").addEventListener("click", () => {
    productList.scrollBy({ left: -220, behavior: "smooth" });
  });

  document.getElementById("scrollRight").addEventListener("click", () => {
    productList.scrollBy({ left: 220, behavior: "smooth" });
  });

  // Rekomendasi
  fetch('get_rekomendasi.php')
    .then(res => res.json())
    .then(data => {
      const rekomList = document.getElementById("recommendation-list");

      data.forEach(item => {
        const card = createProductCard(item);
        rekomList.appendChild(card);
      });
    })
    .catch(err => {
      console.error("Gagal memuat rekomendasi:", err);
    });
});
