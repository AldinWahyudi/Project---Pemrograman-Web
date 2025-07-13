<?php
session_start();
include "../koneksi.php";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
  $email = $_POST['email'] ?? '';
  $password = $_POST['password'] ?? '';

  $sql = "SELECT id, password, role FROM users WHERE email = ?";
  $stmt = $conn->prepare($sql);
  $stmt->bind_param("s", $email);
  $stmt->execute();
  $stmt->store_result();

  if ($stmt->num_rows === 1) {
    $stmt->bind_result($id, $hashed_password, $role);
    $stmt->fetch();

    if (password_verify($password, $hashed_password)) {
      $_SESSION['user_id'] = $id;
      $_SESSION['email'] = $email;
      $_SESSION['role'] = $role;

      // Redirect langsung sesuai role
      $redirect = ($role === 'admin') ? 'admin_panel_upload.php' : '../index.php';
      header("Location: $redirect");
      exit();
    } else {
      $error = "✖ Password salah!";
    }
  } else {
    $error = "✖ Email tidak ditemukan!";
  }

  $stmt->close();
  $conn->close();
}
?>

<!DOCTYPE html>
<html lang="id">

<head>
  <meta charset="UTF-8">
  <title>Login</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="bg-light">
  <div class="container py-5">
    <div class="row justify-content-center">
      <div class="col-md-5">
        <div class="card shadow">
          <div class="card-body">
            <h3 class="text-center mb-4">Login ke Digishop</h3>
            <?php if (!empty($error)) echo "<div class='alert alert-danger text-center'>$error</div>"; ?>
            <form method="POST">
              <div class="mb-3">
                <label for="email" class="form-label">Email:</label>
                <input type="email" name="email" class="form-control" required />
              </div>
              <div class="mb-3">
                <label for="password" class="form-label">Password:</label>
                <input type="password" name="password" class="form-control" required />
              </div>
              <button type="submit" class="btn btn-primary w-100">Login</button>
            </form>
            <div class="text-center mt-3 text-muted">or..</div>
            <a href="../register" class="btn btn-success w-100 mt-2">Create account</a>
          </div>
        </div>
      </div>
    </div>
  </div>
</body>

</html>