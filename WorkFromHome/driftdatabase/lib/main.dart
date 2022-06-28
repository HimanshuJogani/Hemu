import 'package:drift/drift.dart' as drift;
import 'package:drift/drift.dart';
import 'package:driftdatabase/data/datasources/local/database/drift_database.dart';
import 'package:driftdatabase/presentation/cubit/drift_database_cubit.dart';
import 'package:driftdatabase/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DriftDatabaseCubit(),
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: MyHomePage(),
      ),
    );
  }
}
