part of 'locator.dart';

Future<void> _initRepositoryLocator() async {
  locator
    ..registerLazySingleton<AuthenticationRepository>(
      () => AuthenticationRepositoryImpl(
        locator(),
        locator(),
      ),
    )
    ..registerLazySingleton<LeaveRepository>(
      () => LeaveRepositoryImpl(
        locator(),
      ),
    )
    ..registerLazySingleton<WalletRepository>(
      () => WalletRepositoryImpl(
        locator(),
      ),
    );
}
