import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:introscreen/cubit/indicator_state.dart';
import 'package:introscreen/indicator.dart';
import 'package:introscreen/intro2.dart';
import 'package:introscreen/intro3.dart';
import 'package:introscreen/intro4.dart';
import 'package:introscreen/intro5.dart';

import 'cubit/indicator_cubit.dart';

class Introduction extends StatelessWidget {
  Introduction({Key? key}) : super(key: key);

  PageController controller = PageController();
  final List<Widget> _list = <Widget>[Intro2(), Intro3(), Intro4(), Intro5()];

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
                print(num);
                BlocProvider.of<BottomIndicatorCubit>(context)
                    .nextIndicator(num.toDouble());
              },
              children: List.generate(_list.length, (index) {
                return _list[index];
              }),
            ),
          ),
          Indicator(),
        ],
      ),
    );
  }
}
