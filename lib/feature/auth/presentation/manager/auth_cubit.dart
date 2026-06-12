import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_brainer_avr/feature/auth/presentation/manager/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(const AuthState());

  Future<void> register({
    required String email,
    required String password,
  }) async {
    emit(state.copyWith(statusRegister: AuthStatus.loading));
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(state.copyWith(statusRegister: AuthStatus.success));
    } catch (e) {
      print('Registration failed: $e');
      emit(
        state.copyWith(
          statusRegister: AuthStatus.failed,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> login({required String email, required String password}) async {
    emit(state.copyWith(statusLogin: AuthStatus.loading));
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(state.copyWith(statusLogin: AuthStatus.success));
    } catch (e) {
      print('Login failed: $e');
      emit(
        state.copyWith(
          statusLogin: AuthStatus.failed,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  @override
  Future<void> close() {
    print('AuthCubit closedsfkgjdfogkjdfgoihj');
    return super.close();
  }
}
