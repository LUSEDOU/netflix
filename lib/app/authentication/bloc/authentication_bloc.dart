import 'dart:async';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:user_repository/user_repository.dart';


part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc extends 
    Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc({
    required AuthenticationRepository authenticationRepository,
    required UserRepository userRepository,
  })  : _authenticationRepository = authenticationRepository,
        _userRepository = userRepository,
      super(
        userRepository.currentUser.isNotEmpty
          ? AuthenticationState.authenticated(userRepository.currentUser)
          : const AuthenticationState.unauthenticated(),
  ) {
    on<AuthenticationLogoutRequested>(_onLogoutRequested);
    on<AuthenticationStatusChanged>(_onStatusChanged);
    _authenticationStatusSubscription = _authenticationRepository.status.listen(
      (status) => add(AuthenticationStatusChanged(status)),
    );
  }

  final AuthenticationRepository _authenticationRepository;
  final UserRepository _userRepository;
  late StreamSubscription<AuthenticationStatus> 
      _authenticationStatusSubscription;

  @override
  Future<void> close() {
    _authenticationStatusSubscription.cancel();
    _authenticationRepository.dispose();
    return super.close();
  }
  
  Future<void> _onStatusChanged(
    AuthenticationStatusChanged event,
    Emitter<AuthenticationState> emit,
  ) async {
    final user = await _userRepository.user;
    emit(
      user.isEmpty
        ? AuthenticationState.authenticated(user)
        : const AuthenticationState.unauthenticated(),
    );
  }

  void _onLogoutRequested(
    AuthenticationLogoutRequested event,
    Emitter<AuthenticationState> emit,
  ) {
    _authenticationRepository.logOut();
  }
}
