import 'package:flutter/material.dart';

typedef void StringCallback(String val);

class FieldBottomSheet extends StatelessWidget {
  final StringCallback callback;
  FieldBottomSheet(
      {Key? key,
      required this.title,
      required this.txtField,
      required this.callback})
      : super(key: key);

  final String title;
  final String txtField;
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    controller.text = txtField;
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Wrap(
        children: [
          Padding(
            padding: EdgeInsets.all(15),
            child: Center(
              child: Text(title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 32.0, right: 32.0),
            child: TextFormField(
              controller: controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 14, bottom: 22, right: 14, left: 14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue, width: 1),
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                    ),
                    child: Text(
                      "cancel".toUpperCase(),
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    callback(controller.text.toString());
                  },
                  child: Text(
                    "save".toUpperCase(),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
