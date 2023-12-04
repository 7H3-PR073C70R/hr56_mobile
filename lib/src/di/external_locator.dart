part of 'locator.dart';

void _initExternal() {
  locator
    ..registerLazySingleton<Dio>(
      () => Dio(
        BaseOptions(
          baseUrl: AppEnv.apiBaseURL,
          contentType: 'application/json',
          connectTimeout: 100000000,
          headers: {
            'accepts': 'application/json',
          },
        ),
      )..interceptors.addAll(
          [
            TokenInterceptor(storageService: locator()),
            DataParserInterceptor(),
            LoggingInterceptor(logger: locator()),
          ],
        ),
    )
    ..registerLazySingleton<Logger>(
      Logger.new,
    );
}
