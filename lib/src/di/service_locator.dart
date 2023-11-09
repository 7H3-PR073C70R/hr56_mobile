part of 'locator.dart';

void _initServices() {
  locator
    ..registerLazySingleton<LocalStorageService>(
      LocalStorageServiceImpl.new,
    )
    ..registerLazySingleton<UserStorageService>(
      () => UserStorageServiceImpl(
        locator(),
      ),
    );
}
