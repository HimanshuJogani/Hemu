import 'package:flutter/material.dart';

class Pinetrest extends StatelessWidget {
  const Pinetrest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.blue,
              child: Container(
                  decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(100)), // radius of 10.
                color: Colors.white, // green as background color.
              )),
            ),
          ),
          Expanded(
              child: Container(
            color: Colors.white,
            child: Container(
                decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(100)), // radius of 10.
              color: Colors.blue, // green as background color.
            )),
          ))
        ],
      ),
    );
  }
}
