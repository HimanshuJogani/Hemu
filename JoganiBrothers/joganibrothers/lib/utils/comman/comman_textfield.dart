import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

typedef StringValue = String? Function(String? val);
class CommanTextField extends StatelessWidget {
  const CommanTextField({Key? key,required this.controller,required this.title, required this.hintTxt, required this.textType,  required this.callback}) : super(key: key);

  final String title;
  final String hintTxt;
  final TextEditingController controller;
  final TextInputType textType;
  final StringValue callback;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title),
          const SizedBox(height: 5),
          TextFormField (
            controller: controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: hintTxt,
            ),
            keyboardType: textType,
            validator: callback,
         ),
      ],
      ),
    );
  }
}
