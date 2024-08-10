<?php 
include 'header.php';
$kd = mysqli_real_escape_string($conn,$_GET['kode_cs']);
$cs = mysqli_query($conn, "SELECT * FROM customer WHERE kode_customer = '$kd'");
$rows = mysqli_fetch_assoc($cs);
?>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<div class="container" style="padding-bottom: 200px">
	<h2 style=" width: 100%; border-bottom: 4px solid #ff8680"><b>Checkout</b></h2>
	<div class="row">
		<div class="col-md-6">
			<h4>Daftar Pesanan</h4>
			<table class="table table-stripped">
				<tr>
					<th>No</th>
					<th>Nama</th>
					<th>Ukuran</th>
					<th>Harga</th>
					<th>Qty</th>
					<th>Sub Total</th>
				</tr>
				<?php 
				$result = mysqli_query($conn, "SELECT * FROM keranjang WHERE kode_customer = '$kd'");
		

				$no = 1;
				$hasil = 0;
				$jum = 0;
				while($row = mysqli_fetch_assoc($result)){
					$brt = $row['berat']*$row['qty'];
					$jum += $brt;
					?>
					<tr>
						<td><?= $no; ?></td>
						<td><?= $row['nama_produk']; ?></td>
						<td><?= strtoupper($row['ukuran']); ?></td>
						<td>Rp.<?= number_format($row['harga']); ?></td>
						<td><?= $row['qty']; ?></td>
						<td>Rp.<?= number_format($row['harga'] * $row['qty']);  ?></td>
					</tr>
					<?php 
					$total = $row['harga'] * $row['qty'];
					$hasil += $total;
					$no++;
				}
			
				?>
				<tr>
					<td colspan="6" style="text-align: right; font-weight: bold;">Grand Total = <?= number_format($hasil); ?></td>
				</tr>
			</table>
		</div>

	</div>
	<div class="row">
		<div class="col-md-6 bg-success">
			<h5>Pastikan Pesanan Anda Sudah Benar</h5>
		</div>
	</div>
	<br>
	<div class="row">
		<div class="col-md-6 bg-warning">
			<h5>isi Form dibawah ini </h5>
		</div>
	</div>
	<br>
	<form action="proses/order.php" method="POST">
		<input type="hidden" name="kode_cs" value="<?= $kd; ?>">
		<input type="hidden" id="berat" name="berat" value="<?php echo $jum; ?>">
		<input type="hidden" name="prov" value="Aceh">
		<input type="hidden" name="kota" value="Meulaboh/Aceh Barat">
		<input type="hidden" name="tipe" value="">
		<input type="hidden" name="metode_pembayaran" value="">
		<input type="hidden" name="paket" value="">
		<input type="hidden" name="ongkir" value="">
		<input type="hidden" name="estimasi" value="">
		<div class="form-group">
			<label for="exampleInputEmail1">Nama</label>
			<input type="text" class="form-control" id="exampleInputEmail1" placeholder="Nama" name="nama" style="width: 557px;" value="<?= $rows['nama']; ?>" readonly>
		</div>
		<div class="row">
			<?php

			echo "
			<div class='col-md-6'>
			<div class='form-group'>
			<label>Provinsi</label>";
			echo "<label name='provinsi' id='provinsi' class='form-control'>";
			echo "<option>Aceh</option>";
			
			echo "</label>
			</div>
			</div>
			";
	//Get Data Provinsi

			?>


			<div class="col-md-6">
				<div class="form-group">
					<label for="kota">Alamat Kabupaten/kota</label>
					<label id="kota" name="kota" class="form-control">
						<option>Meulaboh/Aceh Barat</option>
		</label>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-md-6">
				<div class="form-group">
					<label for="exampleInputPassword1">Alamat</label>
					<input type="text" class="form-control" id="exampleInputPassword1" placeholder="Alamat" name="almt">
				</div>
			</div>

			<div class="col-md-6">
				<div class="form-group">
					<label for="exampleInputPassword1">Kode Pos</label>
					<input type="text" class="form-control" id="exampleInputPassword1" placeholder="Kode Pos" name="kopos">
				</div>
			</div>
		</div>

	
		<div class="row" style="border-bottom: 2px solid #cacaca; margin-bottom: 18px;">
			<div class="col-md-6">
				<div class="form-group">	
					<label>Metode Pembayaran</label>
					<select id="metode_pembayaran" name="metode_pembayaran" class="form-control">
						<option selected>-- Pilih Metode Pembayaran --</option>
						<option value="Transfer">Transfer</option>
						<option value="COD">COD</option>
					</select>
				</div>
			</div>

		</div>



		<button type="submit" class="btn btn-success"><i class="glyphicon glyphicon-shopping-cart"></i> Order Sekarang</button>
		<a href="keranjang.php" class="btn btn-danger">Cancel</a>
	</form>






</div>









<script type="text/javascript">

	$(document).ready(function(){
		$('#provinsi').change(function(){

			//Mengambil value dari option select provinsi kemudian parameternya dikirim menggunakan ajax 
			var prov = $('#provinsi').val();

			$.ajax({
				type : 'GET',
				url : 'http://localhost/inovasi/cek_ongkir.php',
				data :  'prov_id=' + prov,
				success: function (data) {

					//jika data berhasil didapatkan, tampilkan ke dalam option select kabupaten
					$("#kabupaten").html(data);
				}
			});
		});

		$("#kurir").change(function(){
			//Mengambil value dari option select provinsi asal, kabupaten, kurir, berat kemudian parameternya dikirim menggunakan ajax 
			var asal = $('#asal').val();
			var kab = $('#kabupaten').val();
			var kurir = $('#kurir').val();
			var berat = $('#berat').val();

			$.ajax({
				type : 'POST',
				url : 'http://localhost/inovasi/cek_ongkir.php',
				data :  {'kab_id' : kab, 'kurir' : kurir, 'asal' : asal, 'berat' : berat},
				success: function (data) {

					$("select[name=paket]").html(data);
					
					$("input[name=metode_pembayaran]").val(kurir);
				}
			});
		});

		$("select[name=kota]").change(function(){
			var prov = $("option:selected",this).attr("nama_provinsi");
			var kota = $("option:selected",this).attr("nama_kota");
			var tipe = $("option:selected",this).attr("tipe_kota");

			$("input[name=prov]").val(prov);
			$("input[name=kota]").val(kota);
			$("input[name=tipe]").val(tipe);
			
		});

			$("select[name=paket]").change(function(){
			var paket = $("option:selected",this).attr("paket");
			var ongkir = $("option:selected",this).attr("ongkir");
			var estimasi = $("option:selected",this).attr("etd");

			$("input[name=paket]").val(paket);
			$("input[name=ongkir]").val(ongkir);
			$("input[name=estimasi]").val(estimasi);
			
		});

	});
</script>





<?php 
include 'footer.php';
?>