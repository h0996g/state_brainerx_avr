import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_brainer_avr/feature/home/presentation/cubit/start_cubit.dart';
import 'package:state_brainer_avr/feature/home/presentation/cubit/start_state.dart';
import 'package:state_brainer_avr/feature/profile/presentation/views/profile_page.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StartCubit, StartState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: Text(state.items[state.currentIndex])),
          body: [SizedBox(), ProfilePage()][state.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: context.read<StartCubit>().state.currentIndex,
            onTap: (value) {
              context.read<StartCubit>().setCurrentIndex(value);
            },
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
          ),
        );
      },
    );
  }
}
