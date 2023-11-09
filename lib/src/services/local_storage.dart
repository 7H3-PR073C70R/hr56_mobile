// ignore_for_file: avoid_positional_boolean_parameters

import 'package:hive_flutter/hive_flutter.dart';
import 'package:logger/logger.dart';

abstract class LocalStorageService {
  const LocalStorageService();

  Future<void> initDB();

  void saveToken(String token);

  Future<void> savePreference({required String key, required String data});

  String? getPreference({required String key});

  Future<void> deletePreference({required String key});

  String? getToken();
}

class LocalStorageServiceImpl implements LocalStorageService {
  LocalStorageServiceImpl();

  late Box<String> _box;

  final _tokenKey = '__token';

  @override
  Future<void> initDB() async {
    _box = await Hive.openBox('hr56_box_0');
  }

  @override
  String? getPreference({required String key}) {
    return _box.get(key);
  }

  @override
  Future<void> savePreference({
    required String key,
    required String data,
  }) async {
    await _box.put(key, data);
  }

  @override
  String? getToken() {
    try {
      return _box.get(_tokenKey);
    } catch (e) {
      Logger().e(e);
      return null;
    }
  }

  @override
  void saveToken(String token) {
    try {
      _box.put(_tokenKey, token);
    } catch (e) {
      Logger().e(e);
    }
  }

  @override
  Future<void> deletePreference({required String key}) async {
    try {
      await _box.delete(key);
    } catch (e) {
      Logger().e(e);
    }
  }
}
