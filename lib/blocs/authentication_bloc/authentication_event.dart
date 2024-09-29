part of 'authentication_bloc.dart';

sealed class AuthenticationEvent {}

class AuthenticationUserChanged extends AuthenticationEvent {
  final MyUser? user;

  AuthenticationUserChanged(this.user);
}
