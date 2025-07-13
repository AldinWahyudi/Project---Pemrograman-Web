<?php
include "../koneksi.php";

$name = $_POST['name'];
$brand = $_POST['brand'];
$price = $_POST['price'];
$image = $_POST['image'];

$query = "INSERT INTO produk (name, brand, price, image) VALUES ('$name', '$brand', '$price', '$image')";
mysqli_query($koneksi, $query);

header("Location: admin_panel.php");
exit();
