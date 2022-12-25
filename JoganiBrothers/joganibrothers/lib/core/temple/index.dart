
var htmlContent = """
<!DOCTYPE html>
<html>

<head>
	<title>Invoice Template Design</title>
	<link rel="stylesheet" type="text/css" href="assets/style.css">
</head>

<body>

	<div class="wrapper">
		<div class="invoice_wrapper">
			<div class="header">
				<div class="logo_invoice_wrap">
					<div class="basic_info">
						<p class="gst_in">
							<span class="bold">GSTIN :</span>
							<span>24AAXPJ8653M1ZT</span>
						</p>
						<p class="pan_no">
							<span class="bold">PAN No :</span>
							<span>AAXPJ8653M</span>
						</p>
						<p class="subject">
							<span>Subject to AMRELI Jurisdiction</span>
						</p>
					</div>
					<div class="god">
						<p class="ganeshay">
							<span>Shree Ganeshay Namah</span>
						</p>
						<p class="pan_no">
							<span>Shree Gel Ambe Mataji </span>
						</p>
					</div>
					<div class="number">
						<p class="">
							<span class="bold">Dipakbhai Jogani</span>
						</p>
						<p>
							<span>MO: 98253 99195</span>
						</p>
						<p class="">
							<span class="bold">Khushalbhai Jogani</span>
						</p>
						<p>
							<span>MO: 94287 12703</span>
						</p>
					</div>
				</div>
				<div class="logo_sec">
					<img src="assets/img/Divo.jpeg" alt="code logo" width="20" height="20">
					<div class="title_wrap">
						<p class="title bold">Jogani Brothers</p>
					</div>
					<img src="assets/img/Divo.jpeg" alt="code logo" width="20" height="20">
				</div>
				<div class="shop_address_info">
					<p>
						<span class="bold" style="padding-left: 15%;">General Merchanat & Commission Agent</span>
						<br>
						<span class="bold">Shop No 11, Market Yard Savrkundla Road, Amreli - 365601 </span>
					</p>
				</div>
				<div class="logo_invoice_wrap">
					<div class="warehouse_address_info">
						<p class="warehouse">
							<span class="bold">Warehouse</span>
						</p>
						<p>
							<span>Street no: 5,Rampara Kunkavav road,</span>
						</p>
						<p>
							<span>Amreli - 365601</span>
						</p>
					</div>
					<div>
						<p class="invoice_no">
							<span class="bold">Bill No: </span>
							<span> #3488</span>
						</p>
						<p class="date">
							<span class="bold">Date: </span>
							<span> 08/Jan/2022</span>
						</p>
					</div>
				</div>
				<div class="bill_total_wrap">
					<div class="bill_sec">
						<p>
							<span class="bold">Bill To:</span>
							<br \>
							<span> Himanshu Dipakbhai Jogani</span>
						</p>
					</div>
					<div class="address">
						<p>
							<span class="bold">Address: </span>
							<br \>
							<samp> Jeshingpara street no: 5</samp>
						</p>
					</div>
				</div>
			</div>
			<div class="body">
				<div class="main_table">
					<div class="table_header">
						<div class="row">
							<div class="col col_no">NO.</div>
							<div class="col col_des">ITEM DESCRIPTION</div>
							<div class="col col_price">PRICE</div>
							<div class="col col_qty">WEIGHT</div>
							<div class="col col_total">TOTAL</div>
						</div>
					</div>
					<div class="table_body">
						<div class="row">
							<div class="col col_no">
								<p>01</p>
							</div>
							<div class="col col_des">
								<p class="bold">Web Design</p>
								<p>Lorem ipsum dolor sit.</p>
							</div>
							<div class="col col_price">
								<p>${350}</p>
							</div>
							<div class="col col_qty">
								<p>2</p>
							</div>
							<div class="col col_total">
								<p>700.00</p>
							</div>
						</div>
						<div class="row">
							<div class="col col_no">
								<p>02</p>
							</div>
							<div class="col col_des">
								<p class="bold">Web Development</p>
								<p>Lorem ipsum dolor sit.</p>
							</div>
							<div class="col col_price">
								<p>350</p>
							</div>
							<div class="col col_qty">
								<p>2</p>
							</div>
							<div class="col col_total">
								<p>700.00</p>
							</div>
						</div>
						<div class="row">
							<div class="col col_no">
								<p>03</p>
							</div>
							<div class="col col_des">
								<p class="bold">GitHub</p>
								<p>Lorem ipsum dolor sit.</p>
							</div>
							<div class="col col_price">
								<p>120</p>
							</div>
							<div class="col col_qty">
								<p>1</p>
							</div>
							<div class="col col_total">
								<p>700.00</p>
							</div>
						</div>
						<div class="row">
							<div class="col col_no">
								<p>04</p>
							</div>
							<div class="col col_des">
								<p class="bold">Backend Design</p>
								<p>Lorem ipsum dolor sit.</p>
							</div>
							<div class="col col_price">
								<p>350</p>
							</div>
							<div class="col col_qty">
								<p>2</p>
							</div>
							<div class="col col_total">
								<p>700.00</p>
							</div>
						</div>
						<div class="row">
							<div class="col col_no">
								<p>05</p>
							</div>
							<div class="col col_des">
								<p class="bold">Backend Development</p>
								<p>Lorem ipsum dolor sit.</p>
							</div>
							<div class="col col_price">
								<p>150</p>
							</div>
							<div class="col col_qty">
								<p>1</p>
							</div>
							<div class="col col_total">
								<p>700.00</p>
							</div>
						</div>
					</div>
				</div>
				<div class="paymethod_grandtotal_wrap">
					<div class="paymethod_sec">
						<p class="bold">Payment Status</p>
						<p class="unpaid">UNPAID</p>
					</div>
					<div class="grandtotal_sec">
						<p class="bold">
							<span>SUB TOTAL</span>
							<span>7500</span>
						</p>
						<p>
							<span>Tax Vat 18%</span>
							<span>200</span>
						</p>
						<p>
							<span>Discount 10%</span>
							<span>-700</span>
						</p>
						<p class="bold">
							<span>Grand Total</span>
							<span>7000.0</span>
						</p>
					</div>
				</div>
			</div>
			<div class="bank_info">
				<div>
					<p>
						<span class="bold">BANK OF BARODA</span>
					</p>
					<p>
						<span>A/C NO: 95740500000576</span>
					</p>
					<p>
						<span>IFSC: BARB0AMRELI</span>
					</p>
					<p>Thank you and Best Wishes</p>
				</div>
				<div>
					<p>
						<span class="bold">JOGANI BROTHERS</span>
						<br \>
						<span>sig:</span>
					</p>
				</div>
			</div>
		</div>
	</div>

</body>

</html>
""";
