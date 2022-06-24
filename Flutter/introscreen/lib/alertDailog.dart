import 'package:flutter/material.dart';

class AlertDialogbox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text('Alert Dialog'),
          onPressed: () {
            _showDialog(context);
          },
        ),
      ),
    );
  }
}

void _showDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          "You Are showing integrity".toUpperCase(),
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        content: const Text(
          "You failed a day. No Sugarcoating it. \nThe good news is you can start winning, right here right now. you'll be starting over at Day 1. ",
          style: TextStyle(
            fontSize: 14,
            height: 1.4,
          ),
          textAlign: TextAlign.center,
        ),
        //contentPadding: EdgeInsets.only(top: 12, left: 13, right: 13),
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Oops, I did finish',
                    style: TextStyle(color: Colors.black),
                  )),
              ElevatedButton(
                child: Text("Start Over"),
                style: ElevatedButton.styleFrom(primary: Colors.black),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          )
        ],
      );
    },
  );
}
