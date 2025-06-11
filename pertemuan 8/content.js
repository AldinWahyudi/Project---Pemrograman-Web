// console.clear();

let contentTitle;

console.log(document.cookie);
// File: content.js

// Fungsi dynamicClothingSection tetap sama, tidak perlu diubah
function dynamicClothingSection(ob) {
  let boxDiv = document.createElement("div");
  boxDiv.id = "box";
  let boxLink = document.createElement("a");
  boxLink.href = "/contentDetails.html?" + ob.id;
  let imgTag = document.createElement("img");
  imgTag.src = ob.preview;
  let detailsDiv = document.createElement("div");
  detailsDiv.id = "details";
  let h3 = document.createElement("h3");
  h3.appendChild(document.createTextNode(ob.name));
  let h4 = document.createElement("h4");
  h4.appendChild(document.createTextNode(ob.brand));
  let h2 = document.createElement("h2");
  // Menggunakan format Rupiah
  h2.appendChild(document.createTextNode('Rp ' + new Intl.NumberFormat('id-ID').format(ob.price)));
  boxDiv.appendChild(boxLink);
  boxLink.appendChild(imgTag);
  boxLink.appendChild(detailsDiv);
  detailsDiv.appendChild(h3);
  detailsDiv.appendChild(h4);
  detailsDiv.appendChild(h2);
  return boxDiv;
}

// Mengambil elemen kontainer dari HTML
let containerClothing = document.getElementById("containerClothing");
let containerAccessories = document.getElementById("containerAccessories");

// ==========================================================
// BAGIAN YANG DIUBAH: Menggunakan data lokal, bukan API
// ==========================================================

// Cek apakah dataProdukKamera sudah ada (dari file produk-data.js)
if (typeof dataProdukKamera !== 'undefined') {
  // Loop melalui setiap produk di data lokal
  for (let i = 0; i < dataProdukKamera.length; i++) {
    const produk = dataProdukKamera[i];
    if (produk.isAccessory) {
      // Jika produk adalah aksesoris
      containerAccessories.appendChild(dynamicClothingSection(produk));
    } else {
      // Jika produk adalah kamera (bukan aksesoris)
      containerClothing.appendChild(dynamicClothingSection(produk));
    }
  }
} else {
  console.error("Data produk (dataProdukKamera) tidak ditemukan. Pastikan file produk-data.js sudah dimuat dengan benar.");
}

// Mengatur jumlah item di keranjang (jika ada)
if (document.cookie.indexOf(",counter=") >= 0) {
    var counter = document.cookie.split(",")[1].split("=")[1];
    document.getElementById("badge").innerHTML = counter;
}