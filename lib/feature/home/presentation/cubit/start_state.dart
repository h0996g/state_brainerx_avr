enum GetProfileStatus { initial, loading, success, failure }

enum UpdateProfileStatus { initial, loading, success, failure }

class StartState {
  final int currentIndex;
  final List<String> items;
  final GetProfileStatus getProfileStatus;
  final UpdateProfileStatus updateProfileStatus;
  final Map<String, dynamic>? profileData;
  const StartState({
    this.currentIndex = 0,
    this.items = const ['Home', 'Profile'],
    this.getProfileStatus = GetProfileStatus.initial,
    this.updateProfileStatus = UpdateProfileStatus.initial,
    this.profileData,
  });

  StartState copyWith({
    int? currentIndex,
    GetProfileStatus? getProfileStatus,
    Map<String, dynamic>? profileData,
    UpdateProfileStatus? updateProfileStatus,
  }) {
    return StartState(
      currentIndex: currentIndex ?? this.currentIndex,
      getProfileStatus: getProfileStatus ?? this.getProfileStatus,
      profileData: profileData ?? this.profileData,
      updateProfileStatus: updateProfileStatus ?? this.updateProfileStatus,
    );
  }

  @override
  String toString() =>
      'StartState(currentIndex: $currentIndex, getProfileStatus: $getProfileStatus, profileData: $profileData, updateProfileStatus: $updateProfileStatus)';
}
