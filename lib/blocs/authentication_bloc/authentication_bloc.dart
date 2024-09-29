import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:user_repository/user_repository.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository userRepository;
  late final StreamSubscription<MyUser?> _userSubscription;
// Initialize with Unknown Authentication State
  AuthenticationBloc({required this.userRepository})
      : super(const AuthenticationState.unknown()) { // represents an initial state where the app doesn't know whether the user is authenticated or not.
    //Listen for User Changes
    _userSubscription = userRepository.user.listen((user) {
      add(AuthenticationUserChanged(user));
    });

//Emitting New States
    on<AuthenticationUserChanged>((event, emit) {
      if (event.user != MyUser.empty) {
        emit(AuthenticationState.authenticated(event.user!));
      } else {
        emit(const AuthenticationState.unauthenticated());
      }
    });
  }

//Memory Management
  @override
  Future<void> close() {
    _userSubscription.cancel();
    return super.close();
  }
}
