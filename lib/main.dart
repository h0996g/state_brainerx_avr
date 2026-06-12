import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_brainer_avr/core/helper/observer.dart';
import 'package:state_brainer_avr/feature/auth/presentation/manager/auth_cubit.dart';
import 'package:state_brainer_avr/feature/auth/presentation/views/login_page.dart';
import 'package:state_brainer_avr/feature/home/presentation/cubit/home_cubit.dart';
import 'package:state_brainer_avr/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: MaterialApp(home: const LoginPage()),
    );
  }
}
