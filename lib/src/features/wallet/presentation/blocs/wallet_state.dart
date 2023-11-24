part of 'wallet_bloc.dart';

@freezed
class WalletState with _$WalletState {
  const factory WalletState.initial({
    @Default(ViewState.idle) ViewState viewState,
    dynamic accountLookup,
    dynamic banks,
    dynamic billers,
    dynamic cablePlans,
    dynamic providerDataPlans,
    dynamic transactionDetails,
    dynamic transactions,
    dynamic walletInfo,
    dynamic billPaymentUser,
    String? errorMessage,
  }) = _Initial;
}
