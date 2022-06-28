import 'dart:async';

import 'package:cache/cache.dart';
import 'package:meta/meta.dart';
import 'package:user_repository/user_repository.dart';
import 'package:uuid/uuid.dart';

/// {@template user_repository}
/// Dart packages which manages the user domain.
/// {@endtemplate}
class UserRepository {
  /// {@macro user_repository}
  UserRepository({
    CacheClient? cache,
  }) : _cache = cache ?? CacheClient();

  final CacheClient _cache;

  /// User cache key.
  /// Should only be used for testing purposes.
  @visibleForTesting
  static const userCacheKey = '__user_cache_key__';
  
  /// Returns the current cached user.
  /// Defaults to [User.empty] if there is no cached user.
  User get currentUser {
    return _cache.read<User>(key: userCacheKey) ?? User.empty;
  }

  /// user
  User _user = User.empty;
  
  /// Get and user and give it and id random
  Future<User> get user async {
    if (_user.isNotEmpty) return _user;
    return Future.delayed(
      const Duration(milliseconds: 300),
      () { 
        _cache.write(key: userCacheKey, value: _user);
        return _user = User(id: const Uuid().v4());
      }
    );
  }
}
