import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tddarch/feature/presentation/cubit/numbertrivia_cubit.dart';
import 'package:tddarch/feature/presentation/widgets/trivia_control.dart';

import '../../../injection_container.dart';

class HomePage extends StatefulWidget {
  final controller = TextEditingController();
  late String inputStr;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Padding(
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
              controller: widget.controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Input a number',
              ),
              onChanged: (value) {
                widget.inputStr = value;
              },
              onSubmitted: (_) {
    
              },
            ),
            SizedBox(height: 10),
            Row(
              children: <Widget>[
                Expanded(
                  child: ElevatedButton(
                    child: Text('Search'),
                    onPressed: () {
                      debugPrint("message");
                      // context.read<NumberTriviaCubit>().getNumberTriviaConcerete(int.parse(controller.text));
                      BlocProvider.of<NumberTriviaCubit>(context).getNumberTriviaConcerete(widget.controller.text);
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
      ),
      );
    
  }
}
