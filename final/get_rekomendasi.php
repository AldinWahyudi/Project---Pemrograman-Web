
<?php
include 'koneksi.php';

$query = "SELECT * FROM produk ORDER BY RAND() LIMIT 4";
$result = mysqli_query($conn, $query);

$data = [];

while ($row = mysqli_fetch_assoc($result)) {
    $data[] = $row;
}

echo json_encode($data);
?>
