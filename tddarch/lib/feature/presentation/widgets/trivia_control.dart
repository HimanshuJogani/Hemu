import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tddarch/feature/presentation/cubit/numbertrivia_cubit.dart';
import 'package:tddarch/feature/presentation/cubit/numbertrivia_state.dart';

class TriviaControls extends StatefulWidget {


  @override
  _TriviaControlsState createState() => _TriviaControlsState();
}

class _TriviaControlsState extends State<TriviaControls> {
  final controller = TextEditingController();
  late String inputStr;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Text('Number',
            style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            'gerger',
            style: TextStyle(fontSize: 25),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10),
          TextField(
            controller: controller,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Input a number',
            ),
            onChanged: (value) {
              inputStr = value;
            },
            onSubmitted: (_) {

            },
          ),
          SizedBox(height: 10),
          Row(
            children: <Widget>[
              Expanded(
                child: RaisedButton(
                  child: Text('Search'),
                  color: Theme
                      .of(context)
                      .accentColor,
                  textTheme: ButtonTextTheme.primary,
                  onPressed: () {
                    context.read<NumberTriviaCubit>().getNumberTriviaConcerete(int.parse(controller.text));
                  },
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: RaisedButton(
                  child: Text('Get random trivia'),
                  onPressed: () {
                    //context.read<NumberTriviaCubit>().getNumberTriviaRandom();
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

