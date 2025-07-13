<?php
session_start();
if (!isset($_SESSION['user_id'])) {
  header("Location: Login/login.php");
  exit();
}
?>
<!DOCTYPE html>
<html lang="id">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Keranjang</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body>
  <div id="cartContainer" class="cart-wrapper"></div>
  <div id="totalContainer" class="total-wrapper"></div>
</body>
<script src="cart.js"></script>

</html>