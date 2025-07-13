<?php
session_start();
if (!isset($_SESSION['user_id']) || $_SESSION['role'] !== 'admin') {
    header("Location: login.php");
    exit();
}
?>

<!DOCTYPE html>
<html lang="id">
<head>
  <meta charset="UTF-8">
  <title>Tambah Produk</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container py-5">
  <div class="d-flex justify-content-between mb-4">
    <h3>Tambah Produk Baru</h3>
    <div>
      <a href="admin_panel.php" class="btn btn-outline-primary">🔍 Cek Stok</a>
      <a href="logout.php" class="btn btn-outline-danger">Logout</a>
    </div>
  </div>
  <form action="insert_produk_upload.php" method="post" enctype="multipart/form-data">
    <div class="mb-3">
      <label class="form-label">Nama Kamera</label>
      <input type="text" name="name" class="form-control" required />
    </div>
    <div class="mb-3">
      <label class="form-label">Brand</label>
      <input type="text" name="brand" class="form-control" required />
    </div>
    <div class="mb-3">
      <label class="form-label">Harga</label>
      <input type="number" name="price" class="form-control" required />
    </div>
    <div class="mb-3">
      <label class="form-label">Deskripsi</label>
      <textarea name="description" class="form-control" rows="4" required></textarea>
    </div>
    <div class="mb-3">
      <label class="form-label">Upload Gambar</label>
      <input type="file" name="image" class="form-control" accept="image/*" required />
    </div>
    <button type="submit" class="btn btn-success">Tambah Produk</button>
  </form>
</div>
</body>
</html>