<?php
include "../koneksi.php";

$name = $_POST['name'];
$brand = $_POST['brand'];
$price = $_POST['price'];
$description = $_POST['description'];

$image_name = basename($_FILES["image"]["name"]);
$relative_path = "uploads/" . time() . "_" . $image_name;
$target_file = "../" . $relative_path;
$image_type = strtolower(pathinfo($target_file, PATHINFO_EXTENSION));

// Validasi jenis file
$allowed_types = ['jpg', 'jpeg', 'png', 'webp'];
if (!in_array($image_type, $allowed_types)) {
    die("Format gambar tidak didukung.");
}

// Buat folder uploads jika belum ada
if (!file_exists("../uploads/")) {
    mkdir("../uploads/", 0777, true);
}

if (move_uploaded_file($_FILES["image"]["tmp_name"], $target_file)) {
    $query = "INSERT INTO produk (name, brand, price, description, image)
              VALUES ('$name', '$brand', '$price', '$description', '$relative_path')";
    mysqli_query($conn, $query);
    header("Location: admin_panel.php?status=success");
    exit();
} else {
    echo "Upload gambar gagal.";
}
?>