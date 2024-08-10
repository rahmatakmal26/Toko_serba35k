<?php 
session_start();
unset($_SESSION['admin']);

if(!isset($_SESSION['admin'])){
	header('location:http://localhost/PROJECT-TOKO-ONLINE/index.php');
}

?>
