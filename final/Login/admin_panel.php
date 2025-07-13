<?php
session_start();
if (!isset($_SESSION['user_id']) || $_SESSION['role'] !== 'admin') {
    header("Location: ../login/login.php");
    exit();
}

include "../koneksi.php";

// Fetch produk
$result = $conn->query("SELECT * FROM produk ORDER BY created_at DESC");
?>

<!DOCTYPE html>
<html lang="id">
<head>
  <meta charset="UTF-8">
  <title>Admin Panel</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container py-4">
  <h2 class="mb-3">Admin Panel</h2>

  <?php if (isset($_GET['status']) && $_GET['status'] === 'success'): ?>
    <div class="alert alert-success">✔ Produk berhasil ditambahkan!</div>
  <?php endif; ?>

  <div class="mb-4">
    <a href="admin_panel_upload.php" class="btn btn-primary">+ Tambah Produk Baru</a>
    <a href="logout.php" class="btn btn-outline-danger float-end">Logout</a>
  </div>

  <div class="table-responsive">
    <table class="table table-bordered align-middle text-center">
      <thead class="table-light">
        <tr>
          <th>Gambar</th>
          <th>Nama</th>
          <th>Brand</th>
          <th>Harga</th>
          <th>Aksi</th>
        </tr>
      </thead>
      <tbody>
        <?php while($row = $result->fetch_assoc()): ?>
        <tr>
          <td><img src="../<?= $row['image'] ?>" alt="<?= $row['name'] ?>" width="80"></td>
          <td><?= htmlspecialchars($row['name']) ?></td>
          <td><?= htmlspecialchars($row['brand']) ?></td>
          <td>Rp <?= number_format($row['price'], 0, ',', '.') ?></td>
          <td>
            <a href="edit_produk.php?id=<?= $row['id'] ?>" class="btn btn-sm btn-warning">Edit</a>
            <a href="delete_produk.php?id=<?= $row['id'] ?>" class="btn btn-sm btn-danger" onclick="return confirm('Yakin hapus produk ini?')">Hapus</a>
          </td>
        </tr>
        <?php endwhile; ?>
      </tbody>
    </table>
  </div>
</div>
</body>
</html>