import 'package:flutter/material.dart';

class UserBottomSheet extends StatelessWidget {
  const UserBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextFormField(
                decoration: InputDecoration(
                  // fillColor: Colors.black,
                  // focusColor: Colors.black,
                  hintText: 'Your ID',
                  border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.circular(30)),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  // fillColor: Colors.black,
                  // focusColor: Colors.black,
                  hintText: 'Your First Name',
                  border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.circular(30)),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  // fillColor: Colors.black,
                  // focusColor: Colors.black,
                  hintText: 'Your Last Name',
                  border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.circular(30)),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 20),
              child: GestureDetector(
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.redAccent,
                  ),
                  child: Text(
                    'Submit'.toUpperCase(),
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
