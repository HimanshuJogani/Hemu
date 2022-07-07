import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:introscreen/cubit/indicator_cubit.dart';
import 'package:introscreen/cubit/indicator_state.dart';

class MakeIndicator extends StatelessWidget {
  const MakeIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: BlocBuilder<BottomIndicatorCubit, BottomIndicatorState>(
        builder: (context, state) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DotsIndicator(
                dotsCount: 4,
                position: (state is BottomIndicatorIndexChangeState)
                    ? state.index
                    : 0,
                decorator: DotsDecorator(
                  activeSize: const Size(24.0, 9.0),
                  activeColor: Colors.blue,
                  color: Colors.black,
                  activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
