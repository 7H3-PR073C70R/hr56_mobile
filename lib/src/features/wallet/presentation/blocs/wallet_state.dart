part of 'wallet_bloc.dart';

@freezed
class WalletState with _$WalletState {
  const factory WalletState.initial({
    @Default(ViewState.idle) ViewState viewState,
    @Default(false) bool transactionPINSet,
    LookupAccountModel? accountLookup,
    @Default([]) List<WalletBank> banks,
    @Default([]) List<Biller> billers,
    @Default([]) List<CablePlan> cablePlans,
    @Default([]) List<ProviderDataPlan> providerDataPlans,
    dynamic transactionDetails,
    @Default([]) List<Transaction> transactions,
    Wallet? walletInfo,
    BillPaymentUserInfo? billPaymentUser,
    String? errorMessage,
  }) = _Initial;
}
