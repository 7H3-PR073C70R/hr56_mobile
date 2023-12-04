part of 'wallet_bloc.dart';

@freezed
class WalletEvent with _$WalletEvent {
  const factory WalletEvent.started() = _Started;
  const factory WalletEvent.accountLookup(LookupAccountParam param) =
      _AccountLookup;
  const factory WalletEvent.buyElectricity(BuyElectricityParam param) =
      _BuyElectricity;
  const factory WalletEvent.getBillers(String type) = _GetBillers;
  const factory WalletEvent.getCablePlans(String serviceType) = _GetCablePlans;
  const factory WalletEvent.getProviderDataPlans(String billerId) =
      _GetProviderDataPlans;
  const factory WalletEvent.getTransactionDetails(String reference) =
      _GetTransactionDetails;
  const factory WalletEvent.getTransaction() = _GetTransaction;
  const factory WalletEvent.getWalletInfo() = _GetWalletInfo;
  const factory WalletEvent.purchaseAirtime(PurchaseAirtimeParam param) =
      _PurchaseAirtime;
  const factory WalletEvent.purchaseCableTV(PurchaseCableTvParam param) =
      _PurchaseCableTV;
  const factory WalletEvent.sendMoney(SendMoneyParam param) = _SendMoney;
  const factory WalletEvent.validateBillPayment(
    ValidateBillPaymentUserParam param,
  ) = _ValidateBillPayment;
  const factory WalletEvent.createTransactionPIN(
    CreateTransactionPinParam param,
  ) = _CreateTransactionPIN;
}
