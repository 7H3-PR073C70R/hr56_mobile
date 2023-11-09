part of 'locator.dart';

Future<void> _initUseCaseLocator() async {
  locator
    ..registerLazySingleton<AddBankDetailsUseCase>(
      () => AddBankDetailsUseCase(
        locator(),
      ),
    )
    ..registerLazySingleton<AddEmergencyContactUseCase>(
      () => AddEmergencyContactUseCase(
        locator(),
      ),
    )
    ..registerLazySingleton<AddGuarantorUseCase>(
      () => AddGuarantorUseCase(
        locator(),
      ),
    )
    ..registerLazySingleton<AddNextOfKinUseCase>(
      () => AddNextOfKinUseCase(
        locator(),
      ),
    )
    ..registerLazySingleton<AddReferenceUseCase>(
      () => AddReferenceUseCase(
        locator(),
      ),
    )
    ..registerLazySingleton<LoginUseCase>(
      () => LoginUseCase(
        locator(),
      ),
    )
    ..registerLazySingleton<GetBanksUseCase>(
      () => GetBanksUseCase(
        locator(),
      ),
    )
    ..registerLazySingleton<GetHospitalUseCase>(
      () => GetHospitalUseCase(
        locator(),
      ),
    )
    ..registerLazySingleton<GetPensionAdminsUseCase>(
      () => GetPensionAdminsUseCase(
        locator(),
      ),
    )
    ..registerLazySingleton<GetStateUseCase>(
      () => GetStateUseCase(
        locator(),
      ),
    )
    ..registerLazySingleton<UpdatePersonalInfoUseCase>(
      () => UpdatePersonalInfoUseCase(
        locator(),
      ),
    );
}
