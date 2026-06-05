class HomeState {
  final int counterA;
  final int counterB;
  const HomeState({this.counterA = 0, this.counterB = 0});

  HomeState copyWith({int? counterA, int? counterB}) {
    return HomeState(
      counterA: counterA ?? this.counterA,
      counterB: counterB ?? this.counterB,
    );
  }
}
