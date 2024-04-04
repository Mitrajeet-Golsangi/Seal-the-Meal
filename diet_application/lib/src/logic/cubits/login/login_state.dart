part of 'login_cubit.dart';

enum LoginStatus {
  initial,
  success,
  error,
  submitting,
  onGoingGoogle,
  onGoingFacebook,
  onGoingApple
}

class LoginState extends Equatable {
  final String email;
  final String password;
  final String error;
  final LoginStatus status;

  const LoginState(
      {required this.email,
      required this.password,
      required this.status,
      required this.error});

  factory LoginState.initial() => const LoginState(
        email: "",
        password: "",
        error: "",
        status: LoginStatus.initial,
      );

  LoginState copyWith({
    String? email,
    String? password,
    String? error,
    LoginStatus? status,
  }) {
    return LoginState(
        email: email ?? this.email,
        password: password ?? this.password,
        status: status ?? this.status,
        error: error ?? this.error);
  }

  @override
  List<Object> get props => [email, password, status, error];
}
