import 'package:flutter/material.dart';

import '../../../../utils/comman/comman_textfield.dart';
import '../../data/models/product_model.dart';

class AddProductPage extends StatelessWidget {
  AddProductPage({
    Key? key,
  }) : super(key: key);

  final TextEditingController brandNameController = TextEditingController();
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
              autovalidateMode:  AutovalidateMode.onUserInteraction,
              child: Column(
            children: [
              CommanTextField(
                title: 'Brand Name',
                hintTxt: 'Brand Name',
                controller: brandNameController,
                textType: TextInputType.text,
                validateFun: (value){
                  if(value!.isEmpty){
                    return 'pls write brand name';
                  }
                },
              ),
              CommanTextField(
                title: 'Weight',
                hintTxt: 'Weight',
                controller: weightController,
                textType: TextInputType.number,
                validateFun: (value){
                  if(value!.isEmpty){
                    return 'pls write weight';
                  }
                },
              ), //number
              CommanTextField(
                title: 'Price',
                hintTxt: 'Price',
                controller: priceController,
                textType: TextInputType.number,
                validateFun: (value){
                  if(value!.isEmpty){
                    return 'pls write price';
                  }
                },
              ), //number demail
              CommanTextField(
                title: 'Transportation',
                hintTxt: 'Transportation',
                controller: transportationController,
                textType: TextInputType.number,
                validateFun: (value){
                  if(value!.isEmpty){
                    return 'pls write transportation';
                  }
                },
              ), //number
              CommanTextField(
                title: 'CGST',
                hintTxt: 'CGST',
                controller: cgstController,
                textType: TextInputType.number,
                validateFun: (value) { return null; },
              ), //number required nai
              CommanTextField(
                title: 'SGST',
                hintTxt: 'SGST',
                controller: sgstController,
                textType: TextInputType.number,
                validateFun: (value) { return null; },

              ), //number ||
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 20)),
                onPressed: () {
                  _product.brandname = brandNameController.text;
                  _product.cgst = int.parse(cgstController.text.length==0 ? '0' : cgstController.text);
                  _product.sgst = int.parse(sgstController.text.length==0 ? '0' : sgstController.text);
                  _product.price = int.parse(priceController.text);
                  _product.weight=int.parse(weightController.text);
                  _product.transportation = int.parse(transportationController.text);
                  Navigator.pop(context, {'product': _product});
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
