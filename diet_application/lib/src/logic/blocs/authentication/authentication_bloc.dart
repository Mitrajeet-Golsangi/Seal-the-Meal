import 'dart:async';

// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:diet_application/src/data/repositories/authentication_repository.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/user_model.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationRepository _repo;
  StreamSubscription<User>? _userSubscription;
  AuthenticationBloc({required AuthenticationRepository authRepo})
      : _repo = authRepo,
        super(
          authRepo.currentUser.isNotEmpty
              ? AuthenticationState.authenticated(authRepo.currentUser)
              : const AuthenticationState.unauthenticated(),
        ) {
    on<UserChangedEvent>((event, emit) {
      emit(
        event.user.isNotEmpty
            ? AuthenticationState.authenticated(event.user)
            : const AuthenticationState.unauthenticated(),
      );
    });

    on<LogoutRequestedEvent>((event, emit) {
      unawaited(_repo.logOut());
    });

    _userSubscription = _repo.user.listen((user) {
      add(UserChangedEvent(user: user));
    });
  }

  @override
  Future<void> close() {
    _userSubscription?.cancel();
    return super.close();
  }
}
