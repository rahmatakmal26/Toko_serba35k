<?php 
session_start();
include 'koneksi/koneksi.php';
if(isset($_SESSION['kd_cs'])){

	$kode_cs = $_SESSION['kd_cs'];
}
?>
<!DOCTYPE html>
<html>
<head>
	<title>Toko Serba 35K</title>
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="css/style.css">
	<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.css">
	<script  src="js/jquery.js"></script>
	<script  src="js/bootstrap.min.js"></script>




</head>
<body>
	<div class="container-fluid">
		<div class="row top">
			<center>
				<div class="col-md-4" style="padding: 3px;">
					<span> <i class="glyphicon glyphicon-earphone"></i> 0822 1179 8839</span>
				</div>


				<div class="col-md-4"  style="padding: 3px;">
					<span><i class="glyphicon glyphicon-envelope"></i> tokoserba35k_meulaboh@gmail.com</span>
				</div>

				<div class="col-md-4" id="clock" style="padding: 3px;"></div>
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
            						<!-- #top-social end -->
    
			</div>
			</center>
		</div>
	</div>
	<div class="col-12 col-md-auto mt-2">                    
	<nav class="navbar ">
		<div class="container">

			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#" style="color: #fff;"><b>Toko Serba 35K</b></a>
			</div>

			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-right links" >
					<li><a href="index.php" >Home</a></li>
					<li><a href="produk.php">Produk</a></li>
					<li><a href="about.php">Tentang Kami</a></li>
					<li><a href="manual.php">Cara Order</a></li>
					<?php 
					if(isset($_SESSION['kd_cs'])){
					$kode_cs = $_SESSION['kd_cs'];
					$cek = mysqli_query($conn, "SELECT kode_produk from keranjang where kode_customer = '$kode_cs' ");
					$value = mysqli_num_rows($cek);

						?>
						<li><a href="keranjang.php"><i class="glyphicon glyphicon-shopping-cart"></i> <b>[ <?= $value ?> ]</b></a></li>

						<?php 
					}else{
						echo "
						<li><a href='keranjang.php'><i class='glyphicon glyphicon-shopping-cart'></i> [0]</a></li>

						";
					}
					if(!isset($_SESSION['user'])){
						?>

						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false" style="background-color: #4d0000;"><i class="glyphicon glyphicon-user" ></i> Akun <span class="caret"></span></a>
							<ul class="dropdown-menu" style="background-color: #4d0000;">
								<li><a href="admin/index.php">Login Admin</a></li>
								<li><a href="user_login.php">Login Pelanggan</a></li>
								<li><a href="register.php">Register</a></li>
							</ul>
						</li>
						<?php 
					}else{
						?>
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" style="background-color: #4d0000;" aria-expanded="false"><i class="glyphicon glyphicon-user"></i> <?= $_SESSION['user']; ?> <span class="caret"></span></a>
							<ul class="dropdown-menu" style="background-color: #4d0000;">
								<li><a href="proses/logout.php">Log Out</a></li>
								<li><a href="selesai.php">Pesanan Saya</a></li>
							</ul>
						</li>

						<?php 
					}
					?>
				</ul>
			</div><!-- /.navbar-collapse -->
		</div><!-- /.container-fluid -->
	</nav>