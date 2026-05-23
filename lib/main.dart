import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_brainer_avr/feature/home/presentation/cubit/home_cubit.dart';
import 'package:state_brainer_avr/feature/home/presentation/views/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => HomeCubit(),
        child: const CounterPage(),
      ),
    );
  }
}
