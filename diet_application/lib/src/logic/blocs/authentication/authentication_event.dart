part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class LogoutRequestedEvent extends AuthenticationEvent {}

class UserChangedEvent extends AuthenticationEvent {
  final User user;

  const UserChangedEvent({required this.user});

  @override
  List<Object> get props => [user];
}
