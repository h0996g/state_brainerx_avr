import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'start_state.dart';

class StartCubit extends Cubit<StartState> {
  StartCubit() : super(const StartState());

  void setCurrentIndex(int index) {
    emit(state.copyWith(currentIndex: index));
  }

  Future<void> getProfileData() async {
    emit(state.copyWith(getProfileStatus: GetProfileStatus.loading));
    await Future.delayed(const Duration(seconds: 3));
    FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .get()
        .then((value) {
          emit(
            state.copyWith(
              getProfileStatus: GetProfileStatus.success,
              profileData: value.data(),
            ),
          );
        })
        .catchError((e) {
          emit(state.copyWith(getProfileStatus: GetProfileStatus.failure));
        });
  }

  void editProfile(Map<String, dynamic> newData) async {
    emit(state.copyWith(updateProfileStatus: UpdateProfileStatus.loading));
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .update(newData);
      // After successful update, fetch the updated profile data
      emit(
        state.copyWith(
          updateProfileStatus: UpdateProfileStatus.success,
          profileData: {...?state.profileData, ...newData},
        ),
      );
    } catch (e) {
      emit(state.copyWith(updateProfileStatus: UpdateProfileStatus.failure));
    }
  }
}
