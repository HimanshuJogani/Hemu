import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:introscreen/cubit/indicator_state.dart';
import 'package:introscreen/indicator.dart';
import 'package:introscreen/intro2.dart';
import 'package:introscreen/intro3.dart';
import 'package:introscreen/intro4.dart';
import 'package:introscreen/intro5.dart';
import 'package:introscreen/test_indicator.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'cubit/indicator_cubit.dart';

class Introduction extends StatelessWidget {
  Introduction({Key? key}) : super(key: key);

  PageController controller = PageController();
  final List<Widget> _list = <Widget>[Intro2(), Intro3(), Intro4(), Intro5()];
  var val = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: PageView(
              scrollDirection: Axis.horizontal,
              controller: controller,
              onPageChanged: (num) {
                val = num;
                BlocProvider.of<BottomIndicatorCubit>(context)
                    .nextIndicator(num.toDouble());
              },
              children: List.generate(_list.length, (index) {
                return _list[index];
              }),
            ),
          ),
          //Indicator(),
          BlocBuilder<BottomIndicatorCubit, BottomIndicatorState>(
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onTap: () {
                          controller.jumpToPage(4);
                        },
                        child: Text(
                          (state is BottomIndicatorIndexChangeState &&
                                  state.index == 3)
                              ? "Skip"
                              : 'Skip',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        )),
                    SmoothPageIndicator(
                      controller: controller,
                      count: 4,
                      effect: const JumpingDotEffect(
                          activeDotColor: Colors.deepOrangeAccent,
                          //verticalOffset: 0,
                          jumpScale: 4),
                    ),
                    GestureDetector(
                        onTap: () {
                          print(val);
                          if (val == 3) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TestIndicator()),
                            );
                          } else {
                            controller.nextPage(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.easeIn);
                          }
                        },
                        child: Text(
                          (state is BottomIndicatorIndexChangeState &&
                                  state.index == 3)
                              ? "Done"
                              : 'Next',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        )),
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
