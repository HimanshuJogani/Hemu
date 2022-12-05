import 'package:flutter/material.dart';

class CommanTextField extends StatelessWidget {
  const CommanTextField({Key? key, required this.title, required this.hintTxt}) : super(key: key);

  final String title;
  final String hintTxt;

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
