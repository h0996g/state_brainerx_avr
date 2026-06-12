import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:state_brainer_avr/feature/auth/presentation/manager/auth_cubit.dart';
import 'package:state_brainer_avr/feature/auth/presentation/manager/auth_state.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: emailController,
            decoration: const InputDecoration(hintText: 'Email'),
          ),
          TextField(
            controller: passwordController,
            decoration: const InputDecoration(hintText: 'Password'),
            obscureText: true,
          ),
          BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              switch (state.statusRegister) {
                case AuthStatus.failed:
                  Fluttertoast.showToast(
                    msg: state.errorMessage ?? 'Registration failed',
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0,
                  );
                case AuthStatus.success:
                  Fluttertoast.showToast(
                    msg: 'Registration successful',
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.green,
                    textColor: Colors.white,
                    fontSize: 16.0,
                  );
                  Navigator.pop(context);
                default:
                  break;
              }
            },
            builder: (context, state) {
              if (state.statusRegister == AuthStatus.loading) {
                return const CircularProgressIndicator();
              }
              return ElevatedButton(
                onPressed: () {
                  context.read<AuthCubit>().register(
                    email: emailController.text,
                    password: passwordController.text,
                  );
                },
                child: const Text('Register'),
              );
            },
          ),
        ],
      ),
    );
  }
}
