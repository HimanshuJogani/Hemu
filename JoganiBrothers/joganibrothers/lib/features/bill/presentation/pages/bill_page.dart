import 'package:flutter/material.dart';
import 'package:joganibrothers/utils/comman/comman_date_picker.dart';

import '../../../../utils/comman/comman_textfield.dart';

class BillPage extends StatelessWidget {
  const BillPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Bill'),
        ),
        body: Column(
          children: const [
            CommanTextField(title: 'Name', hintTxt: 'Name'),
            CommanTextField(title: 'Village', hintTxt: 'Village'),
            DatePicker(),
            CommanTextField(title: 'Name', hintTxt: 'Name'),
            CommanTextField(title: 'Name', hintTxt: 'Name')
          ],
        )
      ),
    );
  }
}
