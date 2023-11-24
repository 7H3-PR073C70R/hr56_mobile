part of 'locator.dart';

void _initClients() {
  locator
    ..registerLazySingleton<AuthClient>(
      () => AuthClient(
        locator(),
        baseUrl: '${AppEnv.apiBaseURL}v1/',
      ),
    )
    ..registerLazySingleton<WalletClient>(
      () => WalletClient(
        locator(),
        baseUrl: AppEnv.apiBaseURL,
      ),
    )
    ..registerLazySingleton<LeaveClient>(
      () => LeaveClient(
        locator(),
        baseUrl: '${AppEnv.apiBaseURL}v1/',
      ),
    );
}
