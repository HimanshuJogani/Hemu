import 'package:flutter/material.dart';

class DatePicker extends StatelessWidget {
  const DatePicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _pickDateDialog() {
      showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(1950),
          lastDate: DateTime.now()).then((pickedDate) {
        if (pickedDate == null) {
          //if user tap cancel then this function will stop
          return;
        }
      });
    }
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Date'),
          const SizedBox(height: 5,),
          TextField(
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter Date" //label text of field
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
