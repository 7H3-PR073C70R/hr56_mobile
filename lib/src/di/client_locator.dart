part of 'locator.dart';

void _initClients() {
  
  locator
    ..registerLazySingleton<AuthClient>(
      () => AuthClient(
        locator(),
        baseUrl: '${baseUrl}v1/',
      ),
    )
    ..registerLazySingleton<WalletClient>(
      () => WalletClient(
        locator(),
        baseUrl: baseUrl,
      ),
    )
    ..registerLazySingleton<AppraisalClient>(
      () => AppraisalClient(
        locator(),
        baseUrl: '${baseUrl}v1/',
      ),
    )
    ..registerLazySingleton<LeaveClient>(
      () => LeaveClient(
        locator(),
        baseUrl: '${baseUrl}v1/',
      ),
    );
}
