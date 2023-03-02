import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hr56_staff/src/services/api_service.dart';
import 'package:hr56_staff/src/services/local_storage.dart';
import 'package:hr56_staff/src/services/network_info_service.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

final locator = GetIt.instance;

Future<void> init() async {
//!UseCases DI

//!DataSources DI

//!Repositories DI

//!External Services DI
  locator.registerLazySingleton<NetworkInfoService>(
    () => NetworkInfoServiceImpl(Connectivity()),
  );
  final sharedPreferences = await SharedPreferences.getInstance();
  locator
    ..registerLazySingleton<SharedPreferences>(() => sharedPreferences)
    ..registerSingleton<LocalStorageService>(LocalStorageServiceImpl(locator()))
    ..registerSingleton<ApiService>(ApiServiceImpl(Dio()))
    ..registerSingleton<Logger>(Logger());
}
