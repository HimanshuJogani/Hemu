import 'package:flutter/material.dart';

import '../../../../utils/comman/comman_textfield.dart';
import '../../data/models/product_model.dart';

class AddProductPage extends StatelessWidget {
  AddProductPage({
    Key? key,
  }) : super(key: key);

  final TextEditingController brandNameController = TextEditingController();
  final TextEditingController bagsController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController transportationController =
      TextEditingController();
  final TextEditingController cgstController = TextEditingController();
  final TextEditingController sgstController = TextEditingController();
  final Product _product = new Product();

  @override
  Widget build(BuildContext context) {
    var _formKey = GlobalKey<FormState>();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Add Product'),
        ),
        body: SingleChildScrollView(
          child: Form(
              key: _formKey,
              child: Column(
            children: [
              CommanTextField(
                title: 'Brand Name',
                hintTxt: 'Brand Name',
                controller: brandNameController,
                textType: TextInputType.text,
                callback: (String? val) {
                  if(val!.isEmpty){
                    return "Please Enter Brand name";
                  }
                  return null;
              },
              ),
              CommanTextField(
                title: 'Number of Bags',
                hintTxt: 'Number of Bags',
                controller: bagsController,
                textType: TextInputType.number,
                callback: (String? val) {
                  if(val == null || val!.isEmpty){
                    return "Please Enter Number of Bags";
                  }
                  return null;
                },
              ),
              CommanTextField(
                title: 'Bag Weight in Kg',
                hintTxt: 'Bag Weight in Kg',
                controller: weightController,
                textType: TextInputType.number,
                callback: (String? val) {
                  if(val == null || val!.isEmpty){
                    return "Please Enter Bag Weight in Kg";
                  }
                  return null;
                },
              ), //number
              CommanTextField(
                title: 'Price',
                hintTxt: 'Price',
                controller: priceController,
                textType: TextInputType.number,
                callback: (String? val) {
                  if(val == null || val!.isEmpty){
                    return "Please Enter Price";
                  }
                  return null;
                },
              ), //number demail
              CommanTextField(
                title: 'Transportation',
                hintTxt: 'Transportation',
                controller: transportationController,
                textType: TextInputType.number,
                callback: (String? val) {
                  if(val == null || val!.isEmpty){
                    return null;
                  }
                  return null;
                },
              ), //number
              CommanTextField(
                title: 'CGST',
                hintTxt: 'CGST',
                controller: cgstController,
                textType: TextInputType.number,
                callback: (String? val) {
                  if(val == null || val!.isEmpty){
                    return null;
                  }
                  return null;
                },
              ), //number required nai
              CommanTextField(
                title: 'SGST',
                hintTxt: 'SGST',
                controller: sgstController,
                textType: TextInputType.number,
                callback: (String? val) {
                  if(val == null || val!.isEmpty){
                    return null;
                  }
                  return null;
                },
              ), //number ||
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 20)),
                onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _product.brandname = brandNameController.text;
                  _product.bags = int.parse(bagsController.text);
                  _product.cgst = int.parse(
                      cgstController.text.length == 0 ? '0' : cgstController
                          .text);
                  _product.sgst = int.parse(
                      sgstController.text.length == 0 ? '0' : sgstController
                          .text);
                  _product.price = int.parse(priceController.text);
                  _product.weight = int.parse(weightController.text);
                  _product.transportation =
                      int.parse(transportationController.text);
                  Navigator.pop(context, {'product': _product});
                 }
                },
                child: const Text('Add Product'),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
