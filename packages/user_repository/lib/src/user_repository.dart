import 'dart:async';

import 'package:user_repository/user_repository.dart';
import 'package:uuid/uuid.dart';

/// {@template user_repository}
/// Dart packages which manages the user domain.
/// {@endtemplate}
class UserRepository {
  /// {@macro user_repository}
  User? _user;

  /// Get and user and give it and id random
  Future<User?> getUser() async {
    if (_user != null) return _user;
    return Future.delayed(
      const Duration(milliseconds: 300),
      () => _user = User(id: const Uuid().v4()),
    );
  }
}
