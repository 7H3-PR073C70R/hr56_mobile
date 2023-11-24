// ignore_for_file: avoid_dynamic_calls

import 'dart:convert';

import 'package:hr56_staff/src/features/auth/data/models/login/login_response.dart';
import 'package:hr56_staff/src/services/local_storage.dart';

abstract class UserStorageService {
  String get token;
  void saveToken(String token);
  void saveUser(User? user);
  User? get user;
  void deleteUser();

  void saveCompletedOnboarding();
  bool get completedOnboarding;
}

class UserStorageServiceImpl implements UserStorageService {
  const UserStorageServiceImpl(this._storageService);
  final LocalStorageService _storageService;
  @override
  String get token {
    return _storageService.getToken() ?? '';
  }

  @override
  void saveToken(String token) {
    _storageService.saveToken(token);
  }

  @override
  void deleteUser() {
    _storageService.deletePreference(key: '__user');
  }

  @override
  void saveUser(User? user) {
    if (user == null) return;
    _storageService.savePreference(
      key: '__user',
      data: json.encode(user.toJson()),
    );
  }

  @override
  User? get user {
    final userJson = _storageService.getPreference(key: '__user');
    if (userJson == null) return null;
    return User.fromJson(json.decode(userJson) as Map<String, dynamic>);
  }

  @override
  bool get completedOnboarding {
    return _storageService.getPreference(key: '__onboarding') != null;
  }

  @override
  void saveCompletedOnboarding() {
    _storageService.savePreference(
      key: '__onboarding',
      data: json.encode(true),
    );
  }
}
