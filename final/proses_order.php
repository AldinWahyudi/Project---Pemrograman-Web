<?php
$host = "sql111.infinityfree.com"; // atau 127.0.0.1
$user = "if0_39452103";
$pass = "25gNZWWE29Sel";
$dbname = "if0_39452103_e_commerce"; // Ganti sesuai nama database kamu
$conn = mysqli_connect($host, $user, $pass, $db);

if (!$conn) {
    die("Koneksi gagal: " . mysqli_connect_error());
}

$totalItems = $_POST['totalItems'];
$totalAmount = $_POST['totalAmount'];
$date = date("Y-m-d H:i:s");

$order_query = "INSERT INTO orders (total_items, total_amount, payment_method, shipping_address, created_at) VALUES ('$totalItems', '$totalAmount', '{$_POST['payment_method']}', '{$_POST['shipping_address']}', '$date')";
if (mysqli_query($conn, $order_query)) {
    $order_id = mysqli_insert_id($conn);

    foreach ($_POST as $key => $value) {
        if (strpos($key, "item") === 0 && $key !== "totalItems" && $key !== "totalAmount") {
            $item = mysqli_real_escape_string($conn, $value);
            $sql = "INSERT INTO order_items (order_id, item_detail) VALUES ('$order_id', '$item')";
            mysqli_query($conn, $sql);
        }
    }

    header("Location: orderPlaced.php");
    exit();
} else {
    echo "Gagal menyimpan pesanan: " . mysqli_error($conn);
}

mysqli_close($conn);
