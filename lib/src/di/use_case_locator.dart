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
    )
    ..registerLazySingleton<CreateLeaveUseCase>(
      () => CreateLeaveUseCase(
        locator(),
      ),
    )
    ..registerLazySingleton<GetLeaveTypeUseCase>(
      () => GetLeaveTypeUseCase(
        locator(),
      ),
    )
    ..registerLazySingleton<GetLeaveUseCase>(
      () => GetLeaveUseCase(
        locator(),
      ),
    )
    ..registerLazySingleton<UpdateLeaveUseCase>(
      () => UpdateLeaveUseCase(
        locator(),
      ),
    )
    //! Wallet
    ..registerLazySingleton<AccountLookupUseCase>(
      () => AccountLookupUseCase(
        locator(),
      ),
    )
    ..registerLazySingleton<BuyElectricityUseCase>(
      () => BuyElectricityUseCase(
        locator(),
      ),
    )
    ..registerLazySingleton<CreateWalletUseCase>(
      () => CreateWalletUseCase(
        locator(),
      ),
    )
    ..registerLazySingleton<GetWalletBanksUseCase>(
      () => GetWalletBanksUseCase(
        locator(),
      ),
    )
    ..registerLazySingleton<GetBillersUseCase>(
      () => GetBillersUseCase(
        locator(),
      ),
    )
    ..registerLazySingleton<GetCablePlansUseCase>(
      () => GetCablePlansUseCase(
        locator(),
      ),
    )
    ..registerLazySingleton<GetProviderDataPlansUseCase>(
      () => GetProviderDataPlansUseCase(
        locator(),
      ),
    )
    ..registerLazySingleton<GetTransactionDetailsUseCase>(
      () => GetTransactionDetailsUseCase(
        locator(),
      ),
    )
    ..registerLazySingleton<GetTransactionsUseCase>(
      () => GetTransactionsUseCase(
        locator(),
      ),
    )
    ..registerLazySingleton<GetWalletInfoUseCase>(
      () => GetWalletInfoUseCase(
        locator(),
      ),
    )
    ..registerLazySingleton<PurchaseAirtimeUseCase>(
      () => PurchaseAirtimeUseCase(
        locator(),
      ),
    )
    ..registerLazySingleton<PurchaseCableTVUseCase>(
      () => PurchaseCableTVUseCase(
        locator(),
      ),
    )
    ..registerLazySingleton<SendMoneyUseCase>(
      () => SendMoneyUseCase(
        locator(),
      ),
    )
    ..registerLazySingleton<ValidateBillPaymentUserUsecase>(
      () => ValidateBillPaymentUserUsecase(
        locator(),
      ),
    );
}
