import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
          elevation: 16,
          content: const SizedBox(
            height: 50,
             width: 50,
             child: Center(
               child:CircularProgressIndicator(),
             ),
          )
      );
  }
}
