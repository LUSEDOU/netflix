import 'dart:async';

/// Status of authentication repository
enum AuthenticationStatus {
  /// If current user is authenticated
  authenticated,

  /// If current user is unauthenticated
  unauthenticated,
}


/// {@template authentication_repository}
/// Dart packages which manages the authentication domain.
/// {@endtemplate}
class AuthenticationRepository {
  /// {@macro authentication_repository}
  final _controller = StreamController<AuthenticationStatus>();

  /// Get the authentication repository status
  /// Wait 'till it and if no response throw unauthenticathed
  Stream<AuthenticationStatus> get status async* {
    await Future<void>.delayed(const Duration(seconds: 1));
    yield AuthenticationStatus.unauthenticated;
    yield* _controller.stream;
  }

  /// Log in with the provided [email] and [password].
  /// 
  /// Throws a [LogInFailure] if an exception ocurss.
  Future<void> logIn({
    required String email,
    required String password,
  }) async {
    try {
      await Future.delayed(
        const Duration(milliseconds: 300),
        () => _controller.add(AuthenticationStatus.authenticated),
      );
    } catch (_) {
      throw LogInFailure();
    }
  }

  /// Signs out the current user
  /// 
  /// Throws [LogOutFailure] if an exception ocurss.
  void logOut() {
    try {
      _controller.add(AuthenticationStatus.unauthenticated); 
    } catch (_) {
      throw LogOutFailure();
    }
  }

  /// Close de controller
  void dispose() => _controller.close();
}

/// Throws during the login process if a failure ocurss.
class LogInFailure implements Exception {}

/// Throws during the logOut process if a failure ocurss.
class LogOutFailure implements Exception {}
