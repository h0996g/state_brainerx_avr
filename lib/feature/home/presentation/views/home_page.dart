import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_brainer_avr/feature/home/presentation/cubit/home_cubit.dart';
import 'package:state_brainer_avr/feature/home/presentation/cubit/home_state.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(width: double.infinity),
            Row(
              children: [
                Column(
                  children: [
                    BlocConsumer<HomeCubit, HomeState>(
                      buildWhen: (previous, current) {
                        return previous.counterA != current.counterA;
                      },
                      listenWhen: (previous, current) {
                        return previous.counterA != current.counterA;
                      },
                      listener: (context, state) {
                        if (state.counterA == 5) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Counter A reached 5!')),
                          );
                        }
                      },
                      builder: (context, state) {
                        print('counterA Text build');
                        return Text('Counter: ${state.counterA}');
                      },
                    ),
                    ElevatedButton(
                      onPressed: () {
                        context.read<HomeCubit>().incrementA();
                      },
                      child: Text('Increment'),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        context.read<HomeCubit>().decrementA();
                      },
                      child: Text('Decrement'),
                    ),
                  ],
                ),
                Spacer(),
                Column(
                  children: [
                    BlocBuilder<HomeCubit, HomeState>(
                      buildWhen: (previous, current) {
                        return previous.counterB != current.counterB;
                      },
                      builder: (context, state) {
                        print('counterB Text build');

                        return Text('Counter: ${state.counterB}');
                      },
                    ),
                    ElevatedButton(
                      onPressed: () {
                        context.read<HomeCubit>().incrementB();
                      },
                      child: Text('Increment'),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        context.read<HomeCubit>().decrementB();
                      },
                      child: Text('Decrement'),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
