import 'package:flutter/material.dart';
import 'package:introscreen/footer.dart';
import 'package:introscreen/indicator.dart';

class Intro3 extends StatelessWidget {
  const Intro3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        const Padding(
          padding: EdgeInsets.only(left: 30, right: 30),
          child: Text(
            'Complete the required actions every day. Fail any of them and start over at Day 1.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 17, color: Colors.white),
          ),
        ),
        const SizedBox(
          height: 100,
        ),
        Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.red,
            ),
            padding: const EdgeInsets.all(64),
            child: const Icon(
              Icons.done,
              size: 45,
            )),
        Spacer(),
        const Footer(
          subtitle: 'Check off your tasks and stay committed.',
          title: 'Track Progress',
        ),
      ],
    );
  }
}
