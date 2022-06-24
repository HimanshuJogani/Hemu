import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key, required this.title, required this.subtitle})
      : super(key: key);

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return Container(
      width: screen.width * .9,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            "assets/spadeIcon.png",
            width: 58,
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            title.toUpperCase(),
            style: const TextStyle(
                color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            subtitle,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
          const SizedBox(
            height: 12,
          ),
        ],
      ),
    );
  }
}
