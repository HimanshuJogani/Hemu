import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html_to_pdf/flutter_html_to_pdf.dart';
import 'package:joganibrothers/core/navigation/route_info.dart';
import 'package:joganibrothers/core/theme/text_styles.dart';
import 'package:joganibrothers/features/Invoice/presentation/cubit/invoice_cubit.dart';
import 'package:joganibrothers/features/Invoice/presentation/pages/invoice_page.dart';
import 'package:joganibrothers/features/bill/presentation/cubit/bill_cubit.dart';
import 'package:joganibrothers/features/bill/presentation/cubit/bill_state.dart';
import 'package:joganibrothers/utils/comman/comman_date_picker.dart';
import 'package:joganibrothers/utils/constant/image_path.dart';
import 'package:path_provider/path_provider.dart';
import '../../../../core/theme/jogani_brothers_color.dart';
import '../../../../utils/comman/comman_textfield.dart';
import '../../../products/data/models/product_model.dart';

class BillPage extends StatelessWidget {
  BillPage({Key? key}) : super(key: key);

  final TextEditingController nameController = TextEditingController();
  final TextEditingController villageController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  int count = 0;
  List<Product> productList = [];
  String? generatedPdfFilePath;

  Future<void> generateDocument() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    final targetPath = appDocDir.path;
    const targetFileName = "Jogani-pdf";
    num grandTotal = 0;

    String column = '';
    for(int i =0;i<productList.length;i++){
      double total = (productList[i].price! * productList[i].weight!.toDouble()) / 20;
      grandTotal += total;
      column = '''$column          <div class="row">
    <div class="col col_no">
    <p>01</p>
    </div>
    <div class="col col_des">
    <p class="bold">${productList[i].brandname}</p>
    <p>Lorem ipsum dolor sit.</p>
    </div>
    <div class="col col_price">
    <p>${productList[i].price}</p>
    </div>
    <div class="col col_qty">
    <p>${productList[i].weight}</p>
    </div>
    <div class="col col_total">
    <p>${total}</p>
    </div>
    </div>''';
    }


    var htmlContent = """
<!DOCTYPE html>
<html>
  <head>
    <title>Invoice Template Design</title>
    <style>
      :root {
        --primary: #0000ff;
        --secondary: #3d3d3d;
        --white: #fff
      }

      * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: Lato, sans-serif
      }

      body {
        background: var(--secondary);
        padding: 50px;
        color: var(--secondary);
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 14px
      }

      .bold {
        font-weight: 900
      }

      .light {
        font-weight: 100
      }

      .wrapper {
        background: var(--white);
        padding: 30px
      }

      .invoice_wrapper {
        border: 3px solid var(--primary);
        width: 700px;
        max-width: 100%
      }

      .invoice_wrapper .header .logo_invoice_wrap {
        display: flex;
        justify-content: space-between;
        padding: 30px
      }

      .invoice_wrapper .header .bill_total_wrap {
        display: flex;
        justify-content: space-between;
        padding-left: 30px;
        padding-bottom: 20px;
        padding-right: 30px
      }

      .invoice_wrapper .header .logo_sec {
        display: flex;
        align-items: center;
        justify-content: space-evenly
      }

      .invoice_wrapper .shop_address_info {
        display: flex;
        justify-content: center
      }

      .invoice_wrapper .header .logo_sec .title_wrap {
        margin-left: 5px
      }

      .invoice_wrapper .header .logo_sec .title_wrap .title {
        text-transform: uppercase;
        font-size: 40px;
        color: var(--primary)
      }

      .invoice_wrapper .header .logo_sec .title_wrap .sub_title {
        font-size: 12px
      }

      .invoice_wrapper .header .bill_total_wrap .total_wrap,
      .invoice_wrapper .header .invoice_sec {
        text-align: right
      }

      .invoice_wrapper .header .invoice_sec .invoice {
        font-size: 28px;
        color: var(--primary)
      }

      .invoice_wrapper .header .invoice_sec .date,
      .invoice_wrapper .header .invoice_sec .invoice_no {
        display: flex;
        width: 100%
      }

      .invoice_wrapper .header .invoice_sec .date span:first-child,
      .invoice_wrapper .header .invoice_sec .invoice_no span:first-child {
        width: 70px;
        text-align: left
      }

      .invoice_wrapper .header .invoice_sec .date span:last-child,
      .invoice_wrapper .header .invoice_sec .invoice_no span:last-child {
        width: calc(100% - 70px)
      }

      .invoice_wrapper .header .bill_total_wrap .bill_sec .name,
      .invoice_wrapper .header .bill_total_wrap .total_wrap .price {
        color: var(--primary);
        font-size: 20px
      }

      .invoice_wrapper .body .main_table .table_header {
        background: var(--primary)
      }

      .invoice_wrapper .body .main_table .table_header .row {
        color: var(--white);
        font-size: 18px;
        border-bottom: 0
      }

      .invoice_wrapper .body .main_table .row {
        display: flex;
        border-bottom: 1px solid var(--secondary)
      }

      .invoice_wrapper .body .main_table .row .col {
        padding: 10px
      }

      .invoice_wrapper .body .main_table .row .col_no {
        width: 5%
      }

      .invoice_wrapper .body .main_table .row .col_des {
        width: 45%
      }

      .invoice_wrapper .body .main_table .row .col_price {
        width: 20%;
        text-align: center
      }

      .invoice_wrapper .body .main_table .row .col_qty {
        width: 10%;
        text-align: center
      }

      .invoice_wrapper .body .main_table .row .col_total {
        width: 20%;
        text-align: right
      }

      .invoice_wrapper .body .paymethod_grandtotal_wrap {
        display: flex;
        justify-content: space-between;
        padding: 5px 0 30px;
        align-items: flex-end
      }

      .invoice_wrapper .body .paymethod_grandtotal_wrap .paymethod_sec {
        padding-left: 30px
      }

      .invoice_wrapper .body .paymethod_grandtotal_wrap .paymethod_sec .unpaid {
        background-color: #ef7c94;
        text-align: center
      }

      .invoice_wrapper .body .paymethod_grandtotal_wrap .grandtotal_sec {
        width: 30%
      }

      .invoice_wrapper .body .paymethod_grandtotal_wrap .grandtotal_sec p {
        display: flex;
        width: 100%;
        padding-bottom: 5px
      }

      .invoice_wrapper .body .paymethod_grandtotal_wrap .grandtotal_sec p span {
        padding: 0 10px
      }

      .invoice_wrapper .body .paymethod_grandtotal_wrap .grandtotal_sec p span:first-child {
        width: 60%
      }

      .invoice_wrapper .body .paymethod_grandtotal_wrap .grandtotal_sec p span:last-child {
        width: 40%;
        text-align: right
      }

      .invoice_wrapper .body .paymethod_grandtotal_wrap .grandtotal_sec p:last-child span {
        background: var(--primary);
        padding: 10px;
        color: #fff
      }

      .invoice_wrapper .bank_info {
        display: flex;
        padding: 30px;
        justify-content: space-between
      }

      .invoice_wrapper .footer .bank_info {
        padding: 30px
      }

      .invoice_wrapper .footer>p {
        color: var(--primary);
        text-decoration: underline;
        font-size: 18px;
        padding-bottom: 5px
      }

      .invoice_wrapper .footer .terms .tc {
        font-size: 16px
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
                <span>Shree Gel Ambe Mataji</span>
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
            <img src="${ImagePath.splashImg}" alt="code logo" width="20" height="20">
            <div class="title_wrap">
              <p class="title bold">Jogani Brothers</p>
            </div>
            <img src="${ImagePath.splashImg}" alt="code logo" width="20" height="20">
          </div>
          <div class="shop_address_info">
            <p>
              <span class="bold" style="padding-left:15%">General Merchanat & Commission Agent</span>
              <br>
              <span class="bold">Shop No 11, Market Yard Savrkundla Road, Amreli - 365601</span>
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
                <span class="bold">Bill No:</span>
                <span>$count</span>
              </p>
              <p class="date">
                <span class="bold">Date:</span>
                <span>${dateController.text}</span>
              </p>
            </div>
          </div>
          <div class="bill_total_wrap">
            <div class="bill_sec">
              <p>
                <span class="bold">Bill To:</span>
                <br \>
                <span>${nameController.text}</span>
              </p>
            </div>
            <div class="address">
              <p>
                <span class="bold">Address:</span>
                <br \>
                <samp>${villageController.text}</samp>
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
              ${column}
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
                <span>${grandTotal}</span>
              </p>
              <p>
                <span>Tax Vat 18%</span>
                <span>200</span>
              </p>
              <p>
                <span>Transportation</span>
                <span>-700</span>
              </p>
              <p class="bold">
                <span>Grand Total</span>
                <span>${grandTotal}</span>
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

    final generatedPdfFile = await FlutterHtmlToPdf.convertFromHtmlContent(
        htmlContent, targetPath, targetFileName);
    generatedPdfFilePath = generatedPdfFile.path;
    //await OpenFile.open(file.path);
  }

  @override
  Widget build(BuildContext context) {
    var _formKey = GlobalKey<FormState>();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Bill'),
        ),
        body: BlocBuilder<BillCubit, BillState>(
          builder: (context, state) {
            if (state is BillSuccess) {
              count = state.val;
            }
            if (state is CheckState) {
              productList.add(state.val);
            }
            return SingleChildScrollView(
                child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            children: [
                              const Text(
                                'Bill No:',
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
                            if(val == null || val!.isEmpty){
                              return "Please Enter Name";
                            }
                            return null;
                          },
                        ),
                        CommanTextField(
                          title: 'Village',
                          hintTxt: 'Village',
                          controller: villageController,
                          textType: TextInputType.text,
                          callback: (String? val) {
                            if(val == null || val!.isEmpty){
                              return "Please Enter Village name";
                            }
                            return null;
                          },
                        ),
                        DatePicker(controller: dateController),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListView.builder(
                            primary: false,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: productList.length,
                            itemBuilder: (_, int index) {
                              return Card(
                                  shape: RoundedRectangleBorder( //<-- SEE HERE
                                    side: BorderSide(
                                      color: JoganiBrothersColors.customDarkBlue.withOpacity(0.8),
                                    ),
                                  ),
                                  elevation: 10,
                                  shadowColor: JoganiBrothersColors.customDarkBlue.withOpacity(0.8),
                                  child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Expanded(
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              'BrandName:',
                                              style: TextStyle(fontSize: 10),
                                            ),
                                            const SizedBox(),
                                            Text(
                                                '${productList[index].brandname}',
                                                overflow: TextOverflow.ellipsis,
                                                style: const TextStyle(fontSize: 18)),
                                          ]),
                                    ),
                                    Expanded(
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text('Price:',
                                                style: TextStyle(fontSize: 10)),
                                            const SizedBox(),
                                            Text('${productList[index].price}',
                                                overflow: TextOverflow.ellipsis,
                                                style: const TextStyle(fontSize: 18))
                                          ]),
                                    ),
                                    Expanded(
                                        child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                          const Text('weight:',
                                              style: TextStyle(fontSize: 10)),
                                          const SizedBox(),
                                          Text('${productList[index].weight}',
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(fontSize: 18))
                                        ])),
                                  ],
                                ),
                              ));
                            }),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              textStyle: const TextStyle(fontSize: 20)),
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              await generateDocument();
                              if(generatedPdfFilePath!.isNotEmpty) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) =>
                                      BlocProvider(
                                      create: (context) => InvoiceCubit(),
                                      child: InvoicePage(
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
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            final dynamic res =
                await Navigator.pushNamed(context, RoutesName.products);
            context.read<BillCubit>().check(res['product']);
          },
          backgroundColor: JoganiBrothersColors.customDarkBlue.withOpacity(0.8),
          child: const Icon(Icons.add),
        ),
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
                keyboardType:TextInputType.number,
                decoration: const InputDecoration(hintText: "Bill No"),
                validator: (name) {},
              ),
            ),
            actions: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 20)),
                onPressed: () {
                  context.read<BillCubit>().billSwitchToggle(int.parse(_name.text));
                  Navigator.of(context, rootNavigator: true).pop('_displayTextInputDialog');
                },
                child: const Text('Add'),
              ),
            ],
          );
        });
  }


