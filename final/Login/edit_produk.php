<?php
include "../koneksi.php";
session_start();
if (!isset($_SESSION['user_id']) || $_SESSION['role'] !== 'admin') {
    header("Location: ../login/login.php");
    exit();
}

$id = $_GET['id'];
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $name = $_POST['name'];
    $brand = $_POST['brand'];
    $price = $_POST['price'];
    $description = $_POST['description'];

    mysqli_query($conn, "UPDATE produk SET name='$name', brand='$brand', price='$price', description='$description' WHERE id=$id");
    header("Location: admin_panel.php?status=updated");
    exit();
}

$result = mysqli_query($conn, "SELECT * FROM produk WHERE id=$id");
$data = mysqli_fetch_assoc($result);
?>

<!DOCTYPE html>
<html lang="id">
<head>
  <meta charset="UTF-8">
  <title>Edit Produk</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container py-5">
  <h3>Edit Produk</h3>
  <form method="post">
    <div class="mb-3">
      <label class="form-label">Nama</label>
      <input type="text" name="name" value="<?= $data['name'] ?>" class="form-control" required />
    </div>
    <div class="mb-3">
      <label class="form-label">Brand</label>
      <input type="text" name="brand" value="<?= $data['brand'] ?>" class="form-control" required />
    </div>
    <div class="mb-3">
      <label class="form-label">Harga</label>
      <input type="number" name="price" value="<?= $data['price'] ?>" class="form-control" required />
    </div>
    <div class="mb-3">
      <label class="form-label">Deskripsi</label>
      <textarea name="description" class="form-control" required><?= $data['description'] ?></textarea>
    </div>
    <button type="submit" class="btn btn-warning">Update</button>
    <a href="admin_panel.php" class="btn btn-secondary">Batal</a>
  </form>
</div>
</body>
</html>