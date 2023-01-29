import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html_to_pdf/flutter_html_to_pdf.dart';
import 'package:joganibrothers/features/transport_bill/presentation/cubit/tp_bill_cubit.dart';
import 'package:joganibrothers/features/transport_bill/presentation/cubit/tp_bill_state.dart';
import 'package:joganibrothers/features/transport_invoice/presentation/cubit/transport_invoice_cubit.dart';
import 'package:joganibrothers/features/transport_invoice/presentation/pages/transport_invoice_page.dart';
import 'package:path_provider/path_provider.dart';

import '../../../../core/theme/jogani_brothers_color.dart';
import '../../../../core/theme/text_styles.dart';
import '../../../../utils/comman/comman_date_picker.dart';
import '../../../../utils/comman/comman_textfield.dart';
import '../../../../utils/comman/number_plate_validation.dart';
import '../../../products/data/models/product_model.dart';

class TransportBillPage extends StatelessWidget {
  TransportBillPage({Key? key}) : super(key: key);

  final TextEditingController nameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController vehicleNumberController = TextEditingController();
  final TextEditingController bagsController = TextEditingController();
  final TextEditingController startPointController = TextEditingController();
  final TextEditingController endPointController = TextEditingController();
  final TextEditingController vehicleOwnerNameController = TextEditingController();
  final TextEditingController fullAddressController = TextEditingController();
  final TextEditingController driverNameController = TextEditingController();
  final TextEditingController licenseController = TextEditingController();
  int count = 0;
  String? generatedPdfFilePath;

  Future<void> generateDocument() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    final targetPath = appDocDir.path;
    const targetFileName = "TpJogani-pdf";


    var htmlContent = """
<!DOCTYPE html>
<html>
<head>
	<title>Invoice Template Design</title>
	<style>
:root {
	--primary: #0000ff;
	--secondary: #3d3d3d;
	--white: #fff;
}

* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Lato', sans-serif;
}

body {
	background: var(--white);
	padding: 50px;
	color: var(--secondary);
	display: flex;
	align-items: center;
	justify-content: center;
	font-size: 14px;
}

.bold {
	font-weight: 900;
}

.light {
	font-weight: 100;
}

.wrapper {
	background: var(--white);
	padding: 30px;
}

.invoice_wrapper {
	border: 3px solid var(--primary);
	width: 700px;
	max-width: 100%;
}

.invoice_wrapper .header .logo_invoice_wrap {
	display: flex;
	justify-content: space-between;
	padding: 30px;
}

.invoice_wrapper .header .date {
	display: flex;
	justify-content: right;
	padding: 30px;
}

.invoice_wrapper .header .vehicle_owner {
	display: flex;
	justify-content: space-between;
	padding-left: 30px;
	padding-bottom: 10px;
	padding-right: 30px;
}

.invoice_wrapper .header .bill_total_wrap {
	display: flex;
	justify-content: space-between;
	padding-left: 30px;
	padding-bottom: 20px;
	padding-right: 30px;
}

.invoice_wrapper .header .logo_sec {
	display: flex;
	align-items: center;
	justify-content: space-evenly;
}

.invoice_wrapper .shop_address_info {
	display: flex;
	justify-content: center;
}

.invoice_wrapper .header .logo_sec .title_wrap {
	margin-left: 5px;
}

.invoice_wrapper .header .logo_sec .title_wrap .title {
	text-transform: uppercase;
	font-size: 40px;
	color: var(--primary);
}

.invoice_wrapper .header .logo_sec .title_wrap .sub_title {
	font-size: 12px;
}

.invoice_wrapper .header .invoice_sec,
.invoice_wrapper .header .bill_total_wrap .total_wrap {
	text-align: right;
}

.invoice_wrapper .header .invoice_sec .invoice {
	font-size: 28px;
	color: var(--primary);
}

.invoice_wrapper .header .invoice_sec .invoice_no,
.invoice_wrapper .header .invoice_sec .date {
	display: flex;
	width: 100%;
}

.invoice_wrapper .header .invoice_sec .invoice_no span:first-child,
.invoice_wrapper .header .invoice_sec .date span:first-child {
	width: 70px;
	text-align: left;
}

.invoice_wrapper .header .invoice_sec .invoice_no span:last-child,
.invoice_wrapper .header .invoice_sec .date span:last-child {
	width: calc(100% - 70px);
}

.invoice_wrapper .header .bill_total_wrap .total_wrap .price,
.invoice_wrapper .header .bill_total_wrap .bill_sec .name {
	color: var(--primary);
	font-size: 20px;
}

.invoice_wrapper .body .main_table .table_header {
	background: var(--primary);
}

.invoice_wrapper .body .main_table .table_header .row {
	color: var(--white);
	font-size: 18px;
	border-bottom: 0px;
}

.invoice_wrapper .body .main_table .row {
	display: flex;
	border-bottom: 1px solid var(--secondary);
}

.invoice_wrapper .body .main_table .row .col {
	padding: 10px;
}

.invoice_wrapper .body .main_table .row .col_no {
	width: 5%;
}

.invoice_wrapper .body .main_table .row .col_des {
	width: 45%;
}

.invoice_wrapper .body .main_table .row .col_price {
	width: 20%;
	text-align: center;
}

.invoice_wrapper .body .main_table .row .col_qty {
	width: 10%;
	text-align: center;
}

.invoice_wrapper .body .main_table .row .col_total {
	width: 20%;
	text-align: right;
}

.invoice_wrapper .body .paymethod_grandtotal_wrap {
	display: flex;
	justify-content: space-between;
	padding: 5px 0 30px;
	align-items: flex-end;
}

.invoice_wrapper .body .paymethod_grandtotal_wrap .paymethod_sec {
	padding-left: 30px;
}

.invoice_wrapper .body .paymethod_grandtotal_wrap .paymethod_sec .unpaid {
	background-color: #ef7c94;
	text-align: center;
}

.invoice_wrapper .body .paymethod_grandtotal_wrap .grandtotal_sec {
	width: 30%;
}

.invoice_wrapper .body .paymethod_grandtotal_wrap .grandtotal_sec p {
	display: flex;
	width: 100%;
	padding-bottom: 5px;
}

.invoice_wrapper .body .paymethod_grandtotal_wrap .grandtotal_sec p span {
	padding: 0 10px;
}

.invoice_wrapper .body .paymethod_grandtotal_wrap .grandtotal_sec p span:first-child {
	width: 60%;
}

.invoice_wrapper .body .paymethod_grandtotal_wrap .grandtotal_sec p span:last-child {
	width: 40%;
	text-align: right;
}

.invoice_wrapper .body .paymethod_grandtotal_wrap .grandtotal_sec p:last-child span {
	background: var(--primary);
	padding: 10px;
	color: #fff;
}

.invoice_wrapper .bank_info {
	display: flex;
	padding: 30px;
	justify-content: right;
}

.invoice_wrapper .footer .bank_info {
	padding: 30px;
}

.invoice_wrapper .footer>p {
	color: var(--primary);
	text-decoration: underline;
	font-size: 18px;
	padding-bottom: 5px;
}

.invoice_wrapper .footer .terms .tc {
	font-size: 16px;
}
	</style>
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
					<img src="http://clipart-library.com/image_gallery/386422.jpg" alt="code logo" width="20" height="20">
					<div class="title_wrap">
						<p class="title bold">Jogani Brothers</p>
					</div>
					<img src="http://clipart-library.com/image_gallery/386422.jpg" alt="code logo" width="20" height="20">
				</div>
				<div class="shop_address_info">
					<p>
						<span class="bold" style="padding-left: 15%;">General Merchanat & Commission Agent</span>
						<br>
						<span class="bold">Shop No 11, Market Yard Savrkundla Road, Amreli - 365601 </span>
					</p>
				</div>
				<div class="date">
					<p>
						<span class="bold">Date: </span>
						<span> 08/Jan/2022</span>
					</p>
				</div>
				<div class="vehicle_owner">
					<p>
						<span class="bold">Mrs :</span>
						<span> Himanshu Dipakbhai Jogani</span>	
					</p>
				</div>
				<div class="vehicle_owner">
					<p>
						<span class="bold">Address: </span>
						<samp> Jeshingpara street no: 5</samp>
					</p>
				</div>
				<div class="vehicle_owner">
					<p>
						<span class="bold">Vehicle Truck number GJ 14 AC 6832 in 250 Bags 26kg Recruitment net kilogram 123 According to city Amreli to city Surat has been dispatched.</span>
					</p>
				</div>
				<div class="vehicle_owner">
					<p>
						<span class="bold">Its rent rate is set at 175, and after hearing the products, you will pay 35757 out of 456 of the total rent.</span>
					</p>
				</div>
				<div class="bank_info">
					<p>
						<span class="bold">JOGANI BROTHERS</span>
						<br \>
						<span>sig:</span>
					</p>
				</div>
				<div class="vehicle_owner">
					<p>
						<span class="bold">Vehicle Owner Name: </span>
						<span>Abcd ajds</span>
					</p>
				</div>
				<div class="vehicle_owner">
					<p>
						<span class="bold">Full Address: </span>
						<span>Jeshingpara street no 5 Amreli</span>
					</p>
				</div>
				<div class="vehicle_owner">
					<p>
						<span class="bold">Driver Name: </span>
						<span>Abcd ajds</span>
					</p>
				</div>
				<div class="vehicle_owner" style="padding-bottom: 30px;">
					<p>
						<span class="bold">License Number: </span>
						<span>Abcd ajds</span>
					</p>
				</div>
				<div class="vehicle_owner">
					<p>
						<span class="bold">The above product is checked before being loaded into our truck, sealed, and tal patti-covered and packed. Surat village is to deliver these items to us safely, and we are in charge of any kind of road damage, loss, or other issues.</span>
					</p>
				</div>
				<div class="vehicle_owner">
					<p>
						<span class="bold">Vehicle Owner or Vehicle Driver Signature: </span>
					</p>
				</div>
				<div class="vehicle_owner">
					<p>
						<span class="bold">The recipient of delivery goods: </span>
					</p>
				</div>
			</div>
		</div>
	</div>

</body>

</html>
     """;

    final generatedPdfFile = await FlutterHtmlToPdf.convertFromHtmlContent(
        htmlContent, targetPath, targetFileName);
    generatedPdfFilePath = generatedPdfFile.path;
  }

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transport Bill'),
      ),
      body: BlocBuilder<TransportBillCubit, TransportBillState>(
        builder: (context, state) {
          if (state is BillSuccess) {
            count = state.val;
          }
          return SingleChildScrollView(
              child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          children: [
                            const Text(
                              'TP Bill No:',
                              style: AppTextStyles.labelStyle,
                            ),
                            const SizedBox(width: 5),
                            Text("$count", style: AppTextStyles.labelStyle),
                            const Spacer(),
                            IconButton(
                              icon: const Icon(
                                Icons.edit_note,
                              ),
                              iconSize: 40,
                              onPressed: () {
                                _displayTextInputDialog(context);
                              },
                            ),
                          ],
                        ),
                      ),
                      CommanTextField(
                        title: 'Name',
                        hintTxt: 'Name',
                        controller: nameController,
                        textType: TextInputType.text,
                        callback: (String? val) {
                          if (val == null || val!.isEmpty) {
                            return "Please Enter Name";
                          }
                          return null;
                        },
                      ),
                      CommanTextField(
                        title: 'Address',
                        hintTxt: 'Address',
                        controller: addressController,
                        textType: TextInputType.text,
                        callback: (String? val) {
                          if (val == null || val!.isEmpty) {
                            return "Please Enter Address name";
                          }
                          return null;
                        },
                      ),
                      DatePicker(controller: dateController),
                      CommanTextField(
                        title: 'Vehicle Number',
                        hintTxt: 'Vehicle Number',
                        controller: vehicleNumberController,
                        textType: TextInputType.text,
                        callback: (String? val) {
                          //return UserInfoValidation.numberPlateValidation(val);
                          return null;
                        },
                      ),
                      CommanTextField(
                        title: 'Bags',
                        hintTxt: 'Bags',
                        controller: bagsController,
                        textType: TextInputType.text,
                        callback: (String? val) {
                          if (val == null || val.isEmpty) {
                            return "Please Enter Bags";
                          }
                          return null;
                        },
                      ),
                      CommanTextField(
                        title: 'Start Point',
                        hintTxt: 'Start Point',
                        controller: startPointController,
                        textType: TextInputType.text,
                        callback: (String? val) {
                          if (val == null || val.isEmpty) {
                            return "Please Enter Start Point";
                          }
                          return null;
                        },
                      ),
                      CommanTextField(
                        title: 'End Point',
                        hintTxt: 'End Point',
                        controller: endPointController,
                        textType: TextInputType.text,
                        callback: (String? val) {
                          if (val == null || val.isEmpty) {
                            return "Please Enter End Point";
                          }
                          return null;
                        },
                      ),
                      CommanTextField(
                        title: 'Vehicle Owner Name',
                        hintTxt: 'Vehicle Owner Name',
                        controller: vehicleOwnerNameController,
                        textType: TextInputType.text,
                        callback: (String? val) {
                          if (val == null || val.isEmpty) {
                            return "Please Enter Vehicle Owner Name";
                          }
                          return null;
                        },
                      ),
                      CommanTextField(
                        title: 'Full Address',
                        hintTxt: 'Full Address',
                        controller: fullAddressController,
                        textType: TextInputType.text,
                        callback: (String? val) {
                          if (val == null || val.isEmpty) {
                            return "Please Enter Full Address";
                          }
                          return null;
                        },
                      ),
                      CommanTextField(
                        title: 'Driver Name',
                        hintTxt: 'Driver Name',
                        controller: driverNameController,
                        textType: TextInputType.text,
                        callback: (String? val) {
                          if (val == null || val.isEmpty) {
                            return "Please Enter Driver Name";
                          }
                          return null;
                        },
                      ),
                      CommanTextField(
                        title: 'License Number',
                        hintTxt: 'License Number',
                        controller: licenseController,
                        textType: TextInputType.text,
                        callback: (String? val) {
                          if (val == null || val.isEmpty) {
                            return "Please Enter License Number";
                          }
                          return null;
                        },
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            textStyle: const TextStyle(fontSize: 20)),
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            await generateDocument();
                            if (generatedPdfFilePath!.isNotEmpty) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>
                                    BlocProvider(
                                      create: (context) =>
                                          TransportInvoiceCubit(),
                                      child: TransportInvoicePage(
                                        generatedPdfFilePath: generatedPdfFilePath ??
                                            "",),
                                    )),
                              );
                            }
                          }
                        },
                        child: const Text('Submit'),
                      ),
                    ],
                  )));
        },
      ),
    );
  }
}


Future<void> _displayTextInputDialog(BuildContext context) async {
  final TextEditingController _name = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  return showDialog(
      context: context,
      builder: (context1) {
        return AlertDialog(
          title: const Text('Add custom bill no'),
          content: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: _formKey,
            child: TextFormField(
              onChanged: (value) {},
              controller: _name,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(hintText: "TP Bill No"),
              validator: (name) {
                if (name == null || name.isEmpty) {
                  return "Please Enter Number";
                }
                return null;
              },
            ),
          ),
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 20)),
              onPressed: () {
                context.read<TransportBillCubit>().billSwitchToggle(
                    int.parse(_name.text));
              },
              child: const Text('Add'),
            ),
          ],
        );
      });
}
