// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:diet_application/src/data/repositories/authentication_repository.dart';
import 'package:equatable/equatable.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthenticationRepository _authRepo;

  LoginCubit(this._authRepo) : super(LoginState.initial());

  void emailChanged(String value) =>
      emit(state.copyWith(email: value, status: LoginStatus.initial));

  void passwordChanged(String value) =>
      emit(state.copyWith(password: value, status: LoginStatus.initial));

  Future<void> loginWithGoogle() async {
    emit(state.copyWith(status: LoginStatus.onGoingGoogle));
    try {
      _authRepo.signInWithGoogle();
      emit(state.copyWith(status: LoginStatus.success));
    } catch (e) {
      emit(state.copyWith(status: LoginStatus.error, error: e.toString()));
    }
  }

  Future<void> loginWithFacebook() async {
    emit(state.copyWith(status: LoginStatus.onGoingFacebook));
    try {
      _authRepo.signInWithFacebook();
      emit(state.copyWith(status: LoginStatus.success));
    } catch (e) {
      emit(state.copyWith(status: LoginStatus.error, error: e.toString()));
    }
  }

  Future<void> login() async {
    if (state.status != LoginStatus.submitting) {
      emit(state.copyWith(status: LoginStatus.submitting));
      try {
        await _authRepo.signInWithEmail(
            email: state.email, password: state.password);
        emit(state.copyWith(status: LoginStatus.success));
      } catch (e) {
        String? errorMsg;
        bool errorCode(val) => e.toString().contains(val);

        if (errorCode("user-not-found")) {
          errorMsg = "User does not exist!";
        } else if (errorCode("user-disabled")) {
          errorMsg = "This account has been disabled!";
        } else if (errorCode("wrong-password")) {
          errorMsg = "Wrong Password!";
        }
        if (errorMsg != null) {
          emit(state.copyWith(status: LoginStatus.error, error: errorMsg));
        }
      }
    }
  }
}
