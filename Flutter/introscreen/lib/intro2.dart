import 'package:flutter/material.dart';
import 'package:introscreen/footer.dart';

class Intro2 extends StatelessWidget {
  const Intro2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        const Text(
          'Allow notification so you can set up custom reminders for your daily tasks',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
        SizedBox(
          height: 30,
        ),
        Image.asset(
          'assets/intro2.png',
          color: Colors.white,
          width: 300,
          height: 300,
        ),
        SizedBox(
          height: 30,
        ),
        const Text('Notifications allowed. Go ahead',
            style: TextStyle(fontSize: 20, color: Colors.white)),
        Spacer(),
        Footer(
          title: 'Daily Reminders',
          subtitle: 'Stay on track with custom daily reminders.',
        ),
      ],
    );
  }
}
