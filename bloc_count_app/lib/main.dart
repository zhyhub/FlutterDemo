import 'package:bloc_count_app/bloc/bloc_base.dart';
import 'package:bloc_count_app/bloc/bloc_increment.dart';
import 'package:bloc_count_app/counter_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: BlocProvider<IncrementBloc>(
        child: CounterPage(),
        bloc: IncrementBloc(),
      ),
    );
  }
}
