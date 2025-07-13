<?php
session_start();
$is_logged_in = isset($_SESSION['user_id']);
?>

<!DOCTYPE html>
<html lang="id">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>DigiShop</title>

  <!-- Bootstrap & Icons -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</head>

<body>

  <nav class="navbar navbar-expand-lg navbar-light bg-light shadow-sm fixed-top px-4">
    <div class="container-fluid">
      <a class="navbar-brand fs-3 fw-bold" href="index.php">📷 DigiShop</a>

      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarMain">
        <span class="navbar-toggler-icon"></span>
      </button>

      <div class="collapse navbar-collapse" id="navbarMain">
        <ul class="navbar-nav me-auto mb-2 mb-lg-0 fw-semibold">
          <li class="nav-item">
            <a class="nav-link" href="index.php">Home</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="collection.php">Collection</a>
          </li>
        </ul>

        <form class="d-flex me-4" role="search">
          <input class="form-control me-2" type="search" placeholder="Cari produk..." aria-label="Search">
          <button class="btn btn-outline-secondary" type="submit">Search</button>
        </form>

        <div class="d-flex align-items-center">
          <?php if ($is_logged_in): ?>
            <a href="cart.php" class="position-relative me-3 text-dark">
              <i class="bi bi-cart-fill fs-4"></i>
              <span id="badge" class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-dark">0</span>
            </a>
            <a href="user.php" class="text-dark me-2">
              <i class="bi bi-person-circle fs-4"></i>
            </a>
            <a href="login/logout.php" class="btn btn-outline-danger btn-sm">Logout</a>
          <?php else: ?>
            <a href="Login/login.php" class="btn btn-outline-primary btn-sm">Login</a>
          <?php endif; ?>
        </div>
      </div>
    </div>
  </nav>

  <!-- Spacer -->
  <div class="mt-3"></div>