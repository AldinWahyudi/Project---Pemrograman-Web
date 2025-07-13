<?php
ini_set('display_errors', 1);
error_reporting(E_ALL);
include '../koneksi.php'; // path ke koneksi.php

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $first = $_POST['firstName'];
    $last = $_POST['lastName'];
    $email = $_POST['email'];
    $password = password_hash($_POST['password'], PASSWORD_DEFAULT); // hash

    $day = $_POST['birthdayDay'];
    $month = $_POST['birthdayMonth'];
    $year = $_POST['birthdayYear'];
    $gender = $_POST['gender'];

    $birthdate = "$year-$month-$day";

    $sql = "INSERT INTO users (first_name, last_name, email, password, birthdate, gender)
            VALUES (?, ?, ?, ?, ?, ?)";

    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ssssss", $first, $last, $email, $password, $birthdate, $gender);

    if ($stmt->execute()) {
        header("Location: ../Thank-You/thankyou.html");
    } else {
        echo "Error: " . $stmt->error;
    }

    $stmt->close();
    $conn->close();
}
