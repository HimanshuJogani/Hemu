import 'package:bottomnavigation/bottom_navigation_cubit.dart';
import 'package:bottomnavigation/bottom_navigation_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InBuiltBottomNavigation extends StatelessWidget {
  InBuiltBottomNavigation({Key? key}) : super(key: key);

  static const List<Widget> _widgetOptions = <Widget>[
    Text('Home Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Search Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Profile Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
  ];

  @override
  Widget build(BuildContext context) {
    var activetab = 0;
    return Scaffold(
      body: BlocBuilder<BottomNavigationCubit, BottomNavigationState>(
        builder: (context, state) {
          return Center(
            child: _widgetOptions.elementAt(activetab),
          );
        },
      ),
      bottomNavigationBar:
          BlocBuilder<BottomNavigationCubit, BottomNavigationState>(
        builder: (context, state) {
          if (state is BottomNavigationSuccess) {
            activetab = state.index;
            print(state.index);
            return BottomNavigationBar(
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      label: 'Home',
                      backgroundColor:
                          activetab == 0 ? Colors.blue : Colors.black),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.search),
                      label: 'Search',
                      backgroundColor:
                          activetab == 1 ? Colors.blue : Colors.black),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    label: 'Profile',
                    backgroundColor:
                        activetab == 2 ? Colors.blue : Colors.black,
                  ),
                ],
                type: BottomNavigationBarType.shifting,
                currentIndex: activetab,
                selectedItemColor: Colors.black,
                iconSize: 40,
                onTap: (val) {
                  context.read<BottomNavigationCubit>().updateIndex(val);
                },
                elevation: 5);
          } else {
            return SizedBox();
          }
        },
      ),
    );
  }
}
