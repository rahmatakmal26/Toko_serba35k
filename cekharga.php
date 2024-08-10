<?php
include 'koneksi/koneksi.php';

$ukuran = isset($_POST['ukuran']) ? $_POST['ukuran'] : "";
$kode = isset($_POST['kode']) ? $_POST['kode'] : "";

$result = mysqli_query($conn, "SELECT * FROM produk WHERE kode_produk = '$kode'");
$row = mysqli_fetch_assoc($result);

$uk = isset($row['ukuran']) ? explode(",", $row['ukuran']) : array();
$hrg = isset($row['harga']) ? explode(",", $row['harga']) : array();
$jml = count($uk);

$hasil = "";
$hasil1 = "";

for ($i = 0; $i < $jml; $i++) {
    if ($ukuran == $uk[$i]) {
        $hasil = "Rp. " . number_format($hrg[$i]);
        $hasil1 = "Rp. " . number_format($hrg[$i]);
    }
}

if ($ukuran == "nul") {
    if (strpos($row['harga'], ",") === false) {
        $hasil = "Rp. " . number_format($row['harga']);
        $hasil1 = "Rp. " . number_format($row['harga']);
    } else {
        $a = explode(",", $row['harga']);
        $hasil = "Rp" . number_format($a[0]) . " - " . number_format(end($a));
        $hasil1 = "Rp" . number_format($a[0]) . " - " . number_format(end($a));
    }
}

echo $hasil1 . "|" . $hasil;
?>
