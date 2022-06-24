import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/indicator_cubit.dart';
import 'cubit/indicator_state.dart';

class Indicator extends StatelessWidget {
  const Indicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: BlocBuilder<BottomIndicatorCubit, BottomIndicatorState>(
        builder: (context, state) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DotsIndicator(
                dotsCount: 4,
                position: (state is BottomIndicatorIndexChangeState)
                    ? state.index
                    : 0,
                decorator: DotsDecorator(
                  activeSize: const Size(24.0, 9.0),
                  activeColor: Colors.red,
                  color: Colors.white,
                  activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Text(
                  (state is BottomIndicatorIndexChangeState && state.index == 3)
                      ? ""
                      : "Next",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
