import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:introscreen/OthersPages/briefabout.dart';
import 'package:introscreen/OthersPages/budegtplan.dart';
import 'package:introscreen/OthersPages/gettingstarted.dart';
import 'package:introscreen/alertDailog.dart';
import 'package:introscreen/cubit/indicator_cubit.dart';
import 'package:introscreen/introduction.dart';
import 'package:introscreen/pintrest.dart';
import 'package:introscreen/sql/page/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: SqlPage());
  }
}
