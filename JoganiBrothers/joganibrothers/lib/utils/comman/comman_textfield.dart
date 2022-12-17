import 'package:flutter/material.dart';

class CommanTextField extends StatelessWidget {
  CommanTextField({Key? key, required this.controller,required this.title, required this.hintTxt}) : super(key: key);

  final String title;
  final String hintTxt;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title),
          const SizedBox(height: 5),
          TextField (
            controller: controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: hintTxt,
            ),
         ),
      ],
      ),
    );
  }
}
