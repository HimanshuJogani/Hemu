import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:introscreen/cubit/indicator_cubit.dart';
import 'package:introscreen/introscreen_makemytrip/intro1.dart';
import 'package:introscreen/introscreen_makemytrip/make_indicator.dart';

class IntroMakeTripPage extends StatelessWidget {
  IntroMakeTripPage({Key? key}) : super(key: key);

  PageController controller = PageController();
  final List<Widget> _list = <Widget>[
    MakeIntro1(
      imagepath: 'assets/makeintro1.jpeg',
      title: 'Plan Destination...',
      subtitle:
          'Got bored from your tight schedule? It\'s time to take a break for yourself and plan yourself an unexplored destination',
    ),
    MakeIntro1(
      imagepath: 'assets/makeintro2.jpeg',
      title: 'Pick up your time...',
      subtitle: 'Lift up your mood along with your bag pack!',
    ),
    MakeIntro1(
      imagepath: 'assets/makeintro3.jpeg',
      title: 'Start Your Journey...',
      subtitle: 'Give it a dazzling Voyage to your wanderlust!',
    ),
    MakeIntro1(
      imagepath: 'assets/makeinrto4.jpeg',
      title: 'Enjoy your trip...',
      subtitle: 'Our bags are packed, We\'re ready to go!',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(right: 22, top: 22),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Skip",
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  Icon(
                    Icons.double_arrow_rounded,
                    color: Colors.blue,
                  ),
                ],
              ),
              alignment: Alignment.centerRight,
            ),
            Expanded(
              child: PageView(
                scrollDirection: Axis.horizontal,
                controller: controller,
                onPageChanged: (num) {
                  BlocProvider.of<BottomIndicatorCubit>(context)
                      .nextIndicator(num.toDouble());
                },
                children: List.generate(_list.length, (index) {
                  return _list[index];
                }),
              ),
            ),
            MakeIndicator(),
            const SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }
}
