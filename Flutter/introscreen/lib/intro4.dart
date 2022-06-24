import 'package:flutter/material.dart';
import 'package:introscreen/footer.dart';
import 'package:introscreen/indicator.dart';

class Intro4 extends StatelessWidget {
  const Intro4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        const Padding(
          padding: EdgeInsets.only(left: 30, right: 30),
          child: Text(
            'Share your completed days to your Instagram Story right from the app',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 17, color: Colors.white),
          ),
        ),
        SizedBox(height: 100),
        Image.asset(
          'assets/insta.png',
          width: 100,
          height: 100,
        ),
        SizedBox(
          height: 20,
        ),
        Icon(
          Icons.arrow_upward,
          color: Colors.white,
          size: 60,
        ),
        SizedBox(
          height: 20,
        ),
        Image.asset(
          "assets/spadeIcon.png",
          width: 100,
          height: 100,
        ),
        Spacer(),
        Footer(
          title: 'Easy Sharing',
          subtitle: 'Effortlessly post your completed days.',
        ),
      ],
    );
  }
}
