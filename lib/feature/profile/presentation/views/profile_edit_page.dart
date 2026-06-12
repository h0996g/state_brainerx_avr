import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_brainer_avr/feature/home/presentation/cubit/start_cubit.dart';
import 'package:state_brainer_avr/feature/home/presentation/cubit/start_state.dart';

class ProfileEditPage extends StatefulWidget {
  final Map<String, dynamic>? profileData;
  const ProfileEditPage({super.key, required this.profileData});

  @override
  State<ProfileEditPage> createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  TextEditingController nameController = TextEditingController();

  @override
  void initState() {
    nameController.text = widget.profileData?['fullName'] ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Profile')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            const SizedBox(height: 16.0),
            BlocConsumer<StartCubit, StartState>(
              listener: (context, state) {
                if (state.updateProfileStatus == UpdateProfileStatus.success) {
                  Navigator.pop(context);
                }
              },
              builder: (context, state) {
                if (state.updateProfileStatus == UpdateProfileStatus.loading) {
                  return const CircularProgressIndicator();
                }
                return ElevatedButton(
                  onPressed: () {
                    context.read<StartCubit>().editProfile({
                      'fullName': nameController.text,
                    });
                  },
                  child: const Text('Save'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
