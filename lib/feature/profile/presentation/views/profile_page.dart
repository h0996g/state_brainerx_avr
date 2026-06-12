import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_brainer_avr/feature/home/presentation/cubit/start_cubit.dart';
import 'package:state_brainer_avr/feature/home/presentation/cubit/start_state.dart';
import 'package:state_brainer_avr/feature/profile/presentation/views/profile_edit_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    if (context.read<StartCubit>().state.getProfileStatus ==
        GetProfileStatus.loading) {
      return const Center(child: CircularProgressIndicator());
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'name  ${context.read<StartCubit>().state.profileData?['fullName']}',
          style: TextStyle(color: Colors.black),
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProfileEditPage(
                  profileData: context.read<StartCubit>().state.profileData,
                ),
              ),
            );
          },
          child: const Text('Edit'),
        ),
      ],
    );
  }
}
