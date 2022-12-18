import 'package:flutter/material.dart';

class DatePicker extends StatelessWidget {
  DatePicker({Key? key, required this.controller}) : super(key: key);
  final TextEditingController controller;
  DateTime? pickedDate;
  @override
  Widget build(BuildContext context) {
    void _pickDateDialog() async{
      pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(1950),
          lastDate: DateTime.now());
      controller.text=pickedDate.toString();
      //      .then((pickedDate) {
      //   if (pickedDate == null) {
      //     //if user tap cancel then this function will stop
      //     return DateTime.now();
      //   }
      //   return pickedDate;
      // });
    }
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Date'),
          const SizedBox(height: 5,),
          TextField(
              controller: controller,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter Date",

                //label text of field
              ),
              readOnly: true,
              onTap: () async {
                _pickDateDialog();
              }
          ),
        ],
      ),
    );
  }
}
