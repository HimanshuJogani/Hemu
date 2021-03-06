import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tddarch/feature/presentation/pages/home.dart';
import 'package:tddarch/feature/presentation/widgets/trivia_control.dart';
import 'package:tddarch/injection_container.dart';

import 'feature/presentation/cubit/numbertrivia_cubit.dart';
import 'injection_container.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();  
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
        create: (context) => sl<NumberTriviaCubit>(),
        child: HomePage(),
      ),
    );
  }
}
