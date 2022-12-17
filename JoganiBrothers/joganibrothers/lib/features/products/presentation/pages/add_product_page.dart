import 'package:flutter/material.dart';

import '../../../../utils/comman/comman_textfield.dart';

class AddProductPage extends StatelessWidget {
   AddProductPage({Key? key}) : super(key: key);

  final TextEditingController controller = TextEditingController();
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
               CommanTextField(title: 'Brand Name', hintTxt: 'Brand Name', controller: controller,),
               CommanTextField(title: 'Weight', hintTxt: 'Weight', controller: controller,),
               CommanTextField(title: 'Price', hintTxt: 'Price', controller: controller,),
               CommanTextField(title: 'Transportation', hintTxt: 'Transportation', controller: controller,),
               CommanTextField(title: 'CGST', hintTxt: 'CGST', controller: controller,),
               CommanTextField(title: 'SGST', hintTxt: 'SGST', controller: controller,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20)),
                onPressed: () {},
                child: const Text('Add Product'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
