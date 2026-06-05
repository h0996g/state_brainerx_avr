import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState());
  void incrementA() {
    emit(state.copyWith(counterA: state.counterA + 1));
  }

  void decrementA() {
    emit(state.copyWith(counterA: state.counterA - 1));
  }

  void incrementB() {
    emit(state.copyWith(counterB: state.counterB + 1));
  }

  void decrementB() {
    emit(state.copyWith(counterB: state.counterB - 1));
  }
}
