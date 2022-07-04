import 'package:bottomnavigation/bottom_navigation_cubit.dart';
import 'package:bottomnavigation/bottom_navigation_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => BottomNavigationCubit(),
        child: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: GetNavigation(context),
    );
  }
}

Widget GetNavigation(context) {
  var activetab = 0;
  return Container(
    height: 80,
    width: double.infinity,
    decoration: BoxDecoration(
        shape: BoxShape.rectangle, // BoxShape.circle or BoxShape.retangle
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
          ),
        ]),
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: BlocBuilder<BottomNavigationCubit, BottomNavigationState>(
        builder: (context, state) {
          if (state is BottomNavigationSuccess) {
            activetab = state.index;
            print(state.index);
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                    onTap: () {
                      context.read<BottomNavigationCubit>().updateIndex(0);
                    },
                    child: Icon(Icons.home,
                        color: activetab == 0 ? Colors.blue : Colors.black)),
                GestureDetector(
                  onTap: () {
                    context.read<BottomNavigationCubit>().updateIndex(1);
                  },
                  child: Icon(Icons.add,
                      color: activetab == 1 ? Colors.blue : Colors.black),
                ),
                GestureDetector(
                  onTap: () {
                    context.read<BottomNavigationCubit>().updateIndex(2);
                  },
                  child: Icon(Icons.account_balance,
                      color: activetab == 2 ? Colors.blue : Colors.black),
                ),
                GestureDetector(
                  onTap: () {
                    context.read<BottomNavigationCubit>().updateIndex(3);
                  },
                  child: Icon(Icons.person,
                      color: activetab == 3 ? Colors.blue : Colors.black),
                ),
              ],
            );
          } else {
            return SizedBox();
          }
        },
      ),
    ),
  );
}
