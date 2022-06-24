import 'package:flutter/material.dart';
import 'package:introscreen/footer.dart';

class Intro5 extends StatelessWidget {
  const Intro5({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        const Padding(
          padding: EdgeInsets.only(left: 30, right: 30),
          child: Text(
            'Have you already started 60 Strong?',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 17, color: Colors.white),
          ),
        ),
        const SizedBox(
          height: 60,
        ),
        SizedBox(
          height: 50,
          width: 350,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(primary: Colors.red),
            child: const Text(
              'I\'m Starting Fresh',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
            ),
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        SizedBox(
          height: 50,
          width: 350,
          child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(primary: Colors.white),
              child: const Text(
                'I Already Started',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.normal),
              )),
        ),
        const Spacer(),
        const Footer(
          title: 'Progress check',
          subtitle: 'Already started 60 Strong? Keep going!',
        ),
      ],
    );
  }
}
