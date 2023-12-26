part of 'locator.dart';

void _initDataSource() {
  locator
    ..registerLazySingleton<AuthenticationRemoteDatasource>(
      () => AuthenticationRemoteDatasourceImpl(
        locator(),
        locator(),
      ),
    )
    ..registerLazySingleton<LeaveRemoteDataSource>(
      () => LeaveRemoteDataSourceImpl(
        locator(),
      ),
    )
    ..registerLazySingleton<AppraisalRemoteDataSource>(
      () => AppraisalRemoteDataSourceImpl(
        locator(),
      ),
    )
    ..registerLazySingleton<WalletRemoteDataSource>(
      () => WalletRemoteDataSourceImpl(
        locator(),
      ),
    );
}
