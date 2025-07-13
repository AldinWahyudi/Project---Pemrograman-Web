<?php
// Set header untuk JSON terlebih dahulu
header('Content-Type: application/json; charset=utf-8');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET');
header('Access-Control-Allow-Headers: Content-Type');

// Koneksi database
$host = "sql111.infinityfree.com"; // atau 127.0.0.1
$user = "if0_39452103";
$pass = "25gNZWWE29Sel";
$dbname = "if0_39452103_e_commerce"; // Ganti sesuai nama database kamu
// Buat koneksi
$conn = mysqli_connect($host, $user, $pass, $db);

// Cek koneksi
if (!$conn) {
    http_response_code(500);
    echo json_encode(["error" => "Koneksi database gagal: " . mysqli_connect_error()]);
    exit();
}

try {
    // ✅ Tambahkan kolom 'description' ke query
    $query = "SELECT id, name, brand, price, image, description FROM produk ORDER BY created_at DESC";
    $result = mysqli_query($conn, $query);

    if (!$result) {
        throw new Exception("Query gagal: " . mysqli_error($conn));
    }

    $products = [];

    // Ambil semua data
    while ($row = mysqli_fetch_assoc($result)) {
        $products[] = [
            'id' => $row['id'],
            'name' => $row['name'],
            'brand' => $row['brand'],
            'price' => (float)$row['price'],
            'image' => $row['image'],
            'description' => $row['description'] ?? ""
        ];
    }

    // Return JSON response
    echo json_encode($products);
} catch (Exception $e) {
    http_response_code(500);
    echo json_encode(["error" => $e->getMessage()]);
} finally {
    if ($conn) {
        mysqli_close($conn);
    }
}
