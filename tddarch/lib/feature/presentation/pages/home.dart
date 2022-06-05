import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tddarch/feature/presentation/cubit/numbertrivia_cubit.dart';
import 'package:tddarch/feature/presentation/widgets/trivia_control.dart';

import '../../../injection_container.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Trivia Number'),),
      body: BlocProvider(
        create: (_) => sl<NumberTriviaCubit>(),
        child: TriviaControls(),
      ),
    );
  }
}
