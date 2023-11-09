part of 'locator.dart';

void _intiBloc() {
  locator.registerFactory<AuthenticationBloc>(
    () => AuthenticationBloc(
      locator(),
      locator(),
      locator(),
      locator(),
      locator(),
      locator(),
      locator(),
      locator(),
    ),
  );
}
