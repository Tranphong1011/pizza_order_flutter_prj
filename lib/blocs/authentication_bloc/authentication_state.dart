part of 'authentication_bloc.dart';

enum AuthenticationStatus { authenticated, unauthenticated, unknown }

class AuthenticationState extends Equatable {
  final AuthenticationStatus status;
  final MyUser? user;

  const AuthenticationState._({ // private
    this.status = AuthenticationStatus.unknown,
    this.user
  });

  
  //define groups for status
  const AuthenticationState.unknown() : this._();

  const AuthenticationState.authenticated(MyUser myUser) : 
    this._(status: AuthenticationStatus.authenticated, user: myUser);

  const AuthenticationState.unauthenticated() :
    this._(status: AuthenticationStatus.unauthenticated);

  @override
  List<Object?> get props => [status, user]; // include the properties to compare
}