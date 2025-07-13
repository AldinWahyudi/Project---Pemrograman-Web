<?php
include "../koneksi.php";
$result = mysqli_query($koneksi, "SELECT * FROM produk");
?>

<!DOCTYPE html>
<html lang="id">

<head>
  <meta charset="UTF-8" />
  <title>Produk Kamera</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body>
  <div class="container py-5">
    <h2 class="mb-4">Daftar Kamera</h2>
    <div class="row gy-4">
      <?php while ($row = mysqli_fetch_assoc($result)): ?>
        <div class="col-sm-6 col-md-4 col-lg-3">
          <div class="card h-100 shadow-sm">
            <img src="<?= $row['image'] ?>" class="card-img-top" alt="<?= $row['name'] ?>">
            <div class="card-body">
              <h6 class="card-title mb-1"><?= $row['name'] ?></h6>
              <p class="text-muted mb-1"><?= $row['brand'] ?></p>
              <p class="fw-bold text-primary">Rp <?= number_format($row['price'], 0, ',', '.') ?></p>
            </div>
          </div>
        </div>
      <?php endwhile; ?>
    </div>
  </div>
</body>

</html>