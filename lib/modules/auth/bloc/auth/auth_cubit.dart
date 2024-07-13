import 'package:app/app.dart';
import 'package:app/form_model/password_input.dart';
import 'package:app/form_model/username_input.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

import '../../repository/auth_repository.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final _authRepository = AuthRepository();

  UsernameInput username = const UsernameInput.pure();
  PasswordInput password = const PasswordInput.pure();

  AuthCubit() : super(AuthState());

  void init() {
    emit(AuthInitial());
  }

  void setUsername(String value) {
    emit(
      state.copyWith(
        username: UsernameInput.dirty(value: value),
        usernameError: false,
      ),
    );
  }

  void setPassword(String value) {
    emit(
      state.copyWith(
        password: PasswordInput.dirty(value: value),
        passwordError: false,
      ),
    );
  }

  void togglePasswordVisibility() {
    emit(
      state.copyWith(
        passwordHidden: !state.passwordHidden,
      ),
    );
  }

  void openRegister() {
    emit(AuthRegister());
  }

  void openLogin() {
    emit(AuthLogin());
  }

  void submit() async {
    if (true) {
      emit(state.copyWith(
        status: FormzSubmissionStatus.inProgress,
      ));
      try {
        var login = await _authRepository.login(
            state.username.value, state.password.value);

        App.I.session
          ..setToken(login.username ?? '')
          ..setAuthData(login);

        emit(state.copyWith(
          status: FormzSubmissionStatus.success,
        ));
      } catch (error) {
        emit(state.copyWith(
          usernameError: false,
          passwordError: true,
          status: FormzSubmissionStatus.failure,
        ));
      }
    }
  }
}
