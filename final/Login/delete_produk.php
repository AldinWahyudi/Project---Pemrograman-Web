<?php
include "../koneksi.php";
session_start();
if (!isset($_SESSION['user_id']) || $_SESSION['role'] !== 'admin') {
    header("Location: ../login/login.php");
    exit();
}

$id = $_GET['id'];
// Optional: Hapus gambar dari server
$result = mysqli_query($conn, "SELECT image FROM produk WHERE id = $id");
if ($row = mysqli_fetch_assoc($result)) {
    if (file_exists("../" . $row['image'])) {
        unlink("../" . $row['image']);
    }
}

mysqli_query($conn, "DELETE FROM produk WHERE id = $id");
header("Location: admin_panel.php?status=deleted");
exit();
?>