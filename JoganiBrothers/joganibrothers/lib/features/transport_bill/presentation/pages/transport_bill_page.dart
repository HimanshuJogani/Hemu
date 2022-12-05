import 'package:flutter/material.dart';

class TransportBillPage extends StatelessWidget {
  const TransportBillPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transport Bill'),
      ),
      body: Center(child: Text('Transport Bill')),
    );
  }
}
