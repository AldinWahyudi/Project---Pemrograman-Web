<?php
$host = "sql111.infinityfree.com"; // atau 127.0.0.1
$user = "if0_39452103";
$pass = "25gNZWWE29Sel";
$dbname = "if0_39452103_e_commerce"; // Ganti sesuai nama database kamu

$conn = new mysqli($host, $user, $pass, $dbname);

// Cek koneksi
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
