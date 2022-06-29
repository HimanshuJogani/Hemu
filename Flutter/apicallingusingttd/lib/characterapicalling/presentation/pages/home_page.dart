import 'package:apicallingusingttd/characterapicalling/presentation/bloc/character_cubit.dart';
import 'package:apicallingusingttd/characterapicalling/presentation/bloc/character_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocListener<CharacterCubit, CharacterState>(
          listener: (context, state) {
            if (state is CharacterSuccess) {
              print(state.characterModel);
            }
          },
          child: ElevatedButton(
            onPressed: () {
              context
                  .read<CharacterCubit>()
                  .getSpecificCategory('Breaking Bad');
            },
            child: Text('GetData'),
          ),
        ),
      ),
    );
  }
}
