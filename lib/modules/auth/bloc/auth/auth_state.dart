part of 'auth_cubit.dart';

class AuthState extends Equatable {
  const AuthState({
    this.status = FormzSubmissionStatus.initial,
    this.username = const UsernameInput.pure(),
    this.usernameError = false,
    this.password = const PasswordInput.pure(),
    this.passwordError = false,
    this.passwordHidden = true,
  });

  final FormzSubmissionStatus status;
  final UsernameInput username;
  final bool usernameError;
  final PasswordInput password;
  final bool passwordError;
  final bool passwordHidden;

  AuthState copyWith({
    FormzSubmissionStatus? status,
    UsernameInput? username,
    bool? usernameError,
    PasswordInput? password,
    bool? passwordError,
    bool? passwordHidden,
  }) {
    return AuthState(
        status: status ?? this.status,
        username: username ?? this.username,
        usernameError: usernameError ?? this.usernameError,
        passwordError: passwordError ?? this.passwordError,
        password: password ?? this.password,
        passwordHidden: passwordHidden ?? this.passwordHidden);
  }

  @override
  List<Object?> get props => [
        status,
        username,
        password,
        passwordHidden,
        usernameError,
        passwordError,
      ];
}

class AuthInitial extends AuthState {}

class AuthLogin extends AuthState {}

class AuthRegister extends AuthState {}

class AuthVerification extends AuthState {}

class AuthForgottenPassword extends AuthState {}
