enum AuthStatus { init, loading, success, failed }

class AuthState {
  final AuthStatus statusRegister;
  final AuthStatus statusLogin;
  final String? errorMessage;

  const AuthState({
    this.statusRegister = AuthStatus.init,
    this.statusLogin = AuthStatus.init,
    this.errorMessage,
  });

  AuthState copyWith({
    AuthStatus? statusRegister,
    AuthStatus? statusLogin,
    String? errorMessage,
  }) {
    return AuthState(
      statusRegister: statusRegister ?? this.statusRegister,
      statusLogin: statusLogin ?? this.statusLogin,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  String toString() =>
      'AuthState(statusRegister: $statusRegister, statusLogin: $statusLogin, errorMessage: $errorMessage)';
}
