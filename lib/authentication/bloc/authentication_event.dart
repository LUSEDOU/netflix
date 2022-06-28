part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class AuthenticationLogoutRequested extends AuthenticationEvent {}

class AuthenticationStatusChanged extends AuthenticationEvent {
  @visibleForTesting
  const AuthenticationStatusChanged(this.status);

  final AuthenticationStatus status;
  
  @override
  List<Object> get props => [status];
}
