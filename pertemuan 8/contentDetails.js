console.clear()

let id = location.search.split('?')[1]
console.log(id)

if(document.cookie.indexOf(',counter=')>=0)
{
    let counter = document.cookie.split(',')[1].split('=')[1]
    document.getElementById("badge").innerHTML = counter
}

// File: contentDetails.js

// Fungsi dynamicContentDetails tetap sama, tidak perlu diubah
function dynamicContentDetails(ob)
{
    let mainContainer = document.createElement('div')
    mainContainer.id = 'containerD'
    document.getElementById('containerProduct').appendChild(mainContainer);

    let imageSectionDiv = document.createElement('div')
    imageSectionDiv.id = 'imageSection'

    let imgTag = document.createElement('img')
     imgTag.id = 'imgDetails'
     imgTag.src = ob.preview

    imageSectionDiv.appendChild(imgTag)

    let productDetailsDiv = document.createElement('div')
    productDetailsDiv.id = 'productDetails'

    let h1 = document.createElement('h1')
    h1.appendChild(document.createTextNode(ob.name))

    let h4 = document.createElement('h4')
    h4.appendChild(document.createTextNode(ob.brand))

    let detailsDiv = document.createElement('div')
    detailsDiv.id = 'details'

    let h3DetailsDiv = document.createElement('h3')
    // Menggunakan format Rupiah
    h3DetailsDiv.appendChild(document.createTextNode('Rp ' + new Intl.NumberFormat('id-ID').format(ob.price)))

    let h3 = document.createElement('h3')
    h3.appendChild(document.createTextNode('Description'))

    let para = document.createElement('p')
    para.appendChild(document.createTextNode(ob.description))

    let productPreviewDiv = document.createElement('div')
    productPreviewDiv.id = 'productPreview'

    let h3ProductPreviewDiv = document.createElement('h3')
    h3ProductPreviewDiv.appendChild(document.createTextNode('Product Preview'))
    productPreviewDiv.appendChild(h3ProductPreviewDiv)

    for(let i=0; i<ob.photos.length; i++)
    {
        let imgTagProductPreviewDiv = document.createElement('img')
        imgTagProductPreviewDiv.id = 'previewImg'
        imgTagProductPreviewDiv.src = ob.photos[i]
        imgTagProductPreviewDiv.onclick = function(event)
        {
            document.getElementById("imgDetails").src = this.src 
        }
        productPreviewDiv.appendChild(imgTagProductPreviewDiv)
    }

    let buttonDiv = document.createElement('div')
    buttonDiv.id = 'button'
    let buttonTag = document.createElement('button')
    buttonTag.appendChild(document.createTextNode('Add to Cart'))
    buttonDiv.appendChild(buttonTag)

    // Fungsi tombol 'Add to Cart'
    buttonTag.onclick  =   function()
    {
        let id = location.search.split('?')[1]
        let order = id + " "
        let counter = 1
        if(document.cookie.indexOf(',counter=')>=0)
        {
            order = id + " " + document.cookie.split(',')[0].split('=')[1]
            counter = Number(document.cookie.split(',')[1].split('=')[1]) + 1
        }
        document.cookie = "orderId=" + order + ",counter=" + counter
        document.getElementById("badge").innerHTML = counter
    }
    
    mainContainer.appendChild(imageSectionDiv)
    mainContainer.appendChild(productDetailsDiv)
    productDetailsDiv.appendChild(h1)
    productDetailsDiv.appendChild(h4)
    productDetailsDiv.appendChild(detailsDiv)
    detailsDiv.appendChild(h3DetailsDiv)
    detailsDiv.appendChild(h3)
    detailsDiv.appendChild(para)
    productDetailsDiv.appendChild(productPreviewDiv)
    productDetailsDiv.appendChild(buttonDiv)

    return mainContainer
}


// ==========================================================
// BAGIAN YANG DIUBAH: Mencari data dari lokal, bukan API
// ==========================================================

// Mengambil ID produk dari URL
const idProduk = location.search.split('?')[1];

if (typeof dataProdukKamera !== 'undefined' && idProduk) {
  // Cari produk di dalam array dataProdukKamera yang ID-nya cocok
  const produkDitemukan = dataProdukKamera.find(produk => produk.id === idProduk);
  
  if (produkDitemukan) {
    // Jika produk ditemukan, tampilkan detailnya
    dynamicContentDetails(produkDitemukan);
  } else {
    // Jika tidak ada produk dengan ID tersebut
    console.error('Produk dengan ID ' + idProduk + ' tidak ditemukan.');
    document.getElementById('containerProduct').innerHTML = '<h2>Produk tidak ditemukan</h2>';
  }
} else {
  console.error("Data produk (dataProdukKamera) tidak ditemukan atau ID produk tidak ada di URL.");
}


// Mengatur jumlah item di keranjang (jika ada)
if(document.cookie.indexOf(',counter=')>=0)
{
    let counter = document.cookie.split(',')[1].split('=')[1]
    document.getElementById("badge").innerHTML = counter
}