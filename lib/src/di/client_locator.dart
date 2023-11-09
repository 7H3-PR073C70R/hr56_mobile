part of 'locator.dart';

void _initClients() {
  locator.registerLazySingleton<AuthClient>(
    () => AuthClient(
      locator(),
    ),
  );
}
