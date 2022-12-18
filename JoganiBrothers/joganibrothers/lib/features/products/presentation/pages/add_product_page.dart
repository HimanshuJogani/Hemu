import 'package:flutter/material.dart';

import '../../../../utils/comman/comman_textfield.dart';
import '../../data/models/product_model.dart';

class AddProductPage extends StatelessWidget {
   AddProductPage({Key? key}) : super(key: key);

   final TextEditingController brandNameController = TextEditingController();
   final TextEditingController weightController = TextEditingController();
   final TextEditingController priceController = TextEditingController();
   final TextEditingController transportationController = TextEditingController();
   final TextEditingController cgstController = TextEditingController();
   final TextEditingController sgstController = TextEditingController();
   Product? _product;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Add Product'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children:  [
               CommanTextField(title: 'Brand Name', hintTxt: 'Brand Name', controller: brandNameController,),
               CommanTextField(title: 'Weight', hintTxt: 'Weight', controller: weightController,),//number
               CommanTextField(title: 'Price', hintTxt: 'Price', controller: priceController,),//number demail
               CommanTextField(title: 'Transportation', hintTxt: 'Transportation', controller: transportationController,),//number
               CommanTextField(title: 'CGST', hintTxt: 'CGST', controller: cgstController,),//number required nai
               CommanTextField(title: 'SGST', hintTxt: 'SGST', controller: sgstController,),//number ||
              ElevatedButton(
                style: ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20)),
                onPressed: () {
                  _product?.brandname=brandNameController.text;
                  _product?.cgst=int.parse(cgstController.text);
                  _product?.sgst=int.parse(cgstController.text);
                  _product?.price=int.parse(priceController.text);
                  _product?.transportation=int.parse(transportationController.text);
                  Navigator.pop(context, {'product':_product});
                },
                child: const Text('Add Product'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
