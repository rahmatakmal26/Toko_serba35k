<?php 
session_start();
include '../koneksi/koneksi.php';
if(!isset($_SESSION['admin'])){
	header('location:index.php');
}
?>

<!DOCTYPE html>
<html>
<head>
	<title>ADMIN Toko Serba 35K</title>
	<link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="../css/style.css">
	<link rel="stylesheet" type="text/css" href="../css/bootstrap-theme.css">
	<script  src="../js/jquery.js"></script>
	<script  src="../js/bootstrap.min.js"></script>


</head>
<body>

	<nav class="navbar navbar-default" style="padding: 5px;">
		<div class="container">

			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
			</div>

			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-left">

					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="glyphicon glyphicon-folder-close"></i> Data Master <span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="m_produk.php">Master Produk</a></li>
							<li><a href="m_customer.php">Master Customer</a></li>
						</ul>
					</li>

					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="glyphicon glyphicon-retweet"></i> Data Transaksi <span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="produksi.php">Pesanan</a></li>
							<!-- <li><a href="inventory.php">Inventory</a></li> -->
							
						</ul>
					</li>

					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="glyphicon glyphicon-stats"></i> Laporan <span class="caret"></span></a>
						<ul class="dropdown-menu">
						<!-- 	<li><a href="laporan_penjualan.php">Laporan Penjualan</a></li>
							<li><a href="laporan_profit.php">Laporan Profit</a></li> -->
							<li><a href="laporan_omset.php">Laporan Penjualan</a></li>
<!-- 							<li><a href="laporan_pembatalan.php">Laporan Pembatalan	</a></li>
							<li><a href="laporan_inventory.php">Laporan Inventory</a></li> -->
							<!-- <li><a href="laporan_produksi.php">Laporan Produksi</a></li> -->
						</ul>
					</li>
					<li><a href="halaman_utama.php">Dashboard</a></li>

				</ul>

				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="glyphicon glyphicon-user"></i> Admin <span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="proses/logout.php">Log Out</a></li>
						</ul>
					</li>

					<li class="dropdown" id="clock" style="padding: 15px;">
            		<script type="text/javascript">
                		function showTime() {
                		    var months = ['Januari', 'Februari', 'Maret', 'April', 'Mei', 'Juni', 'Juli', 'Agustus', 'September', 'Oktober', 'November', 'Desember'];
                			var myDays = ['Minggu', 'Senin', 'Selasa', 'Rabu', 'Kamis', 'Jum&#39;at', 'Sabtu'];
                			var date = new Date();
                			var day = date.getDate();
                			var month = date.getMonth();
                			var thisDay = date.getDay(),
                			    thisDay = myDays[thisDay];
                			var yy = date.getYear();
                			var year = (yy < 1000) ? yy + 1900 : yy;
                			
                		    var a_p = "";
                		    var today = new Date();
                		    var curr_hour = today.getHours();
                		    var curr_minute = today.getMinutes();
                		    var curr_second = today.getSeconds();
                		    if (curr_hour < 12) {
                		        a_p = "AM";
                		    } else {
                		        a_p = "PM";
                		    }
                		    if (curr_hour == 0) {
                		        curr_hour = 12;
                		    }
                		    if (curr_hour > 12) {
                		        curr_hour = curr_hour - 12;
                		    }
                		    curr_hour = checkTime(curr_hour);
                		    curr_minute = checkTime(curr_minute);
                		    curr_second = checkTime(curr_second);
                		    document.getElementById('clock').innerHTML=thisDay + ', ' + day + ' ' + months[month] + ' ' + year + ' ' + curr_hour + ":" + curr_minute + ":" + curr_second + " " + a_p;
                		}
                 
                		function checkTime(i) {
                		    if (i < 10) {
                		        i = "0" + i;
                		    }
                		    return i;
                		}
                		setInterval(showTime, 500);
            		</script>
					</li>

				</ul>
			</div><!-- /.navbar-collapse -->
		</div><!-- /.container-fluid -->
	</nav>



