import 'package:hr56_staff/src/features/wallet/data/client/wallet_client.dart';
import 'package:hr56_staff/src/features/wallet/data/models/biller_plan/get_biller_plan_param.dart';
import 'package:hr56_staff/src/features/wallet/data/models/buy_electricity/buy_electricity_param.dart';
import 'package:hr56_staff/src/features/wallet/data/models/create_wallet/create_wallet_param.dart';
import 'package:hr56_staff/src/features/wallet/data/models/look_up_account/look_up_account_param.dart';
import 'package:hr56_staff/src/features/wallet/data/models/provider_data_plan/get_provider_data_param.dart';
import 'package:hr56_staff/src/features/wallet/data/models/purchase_airtime/purchase_airtime_param.dart';
import 'package:hr56_staff/src/features/wallet/data/models/purchase_cable_tv/purchase_cable_tv_param.dart';
import 'package:hr56_staff/src/features/wallet/data/models/send_money/send_money_param.dart';
import 'package:hr56_staff/src/features/wallet/data/models/validate_bill_payment_user/validate_bill_payment_user_param.dart';

abstract class WalletRemoteDataSource {
  Future<dynamic> getTransaction();

  Future<dynamic> getTransactionDetails(
    String reference,
  );

  Future<dynamic> getWalletInfo();

  Future<void> sendMoney(
    SendMoneyParam param,
  );

  Future<dynamic> getBanks();

  Future<dynamic> accountLookup(
    LookupAccountParam param,
  );

  Future<dynamic> getBillers(
    String type,
  );

  Future<dynamic> getProviderDataPlans(
    String billerId,
  );

  Future<dynamic> getCablePlans(
    String serviceType,
  );

  Future<void> purchaseAirtime(
    PurchaseAirtimeParam param,
  );

  Future<dynamic> validateBillPaymentUSer(
    ValidateBillPaymentUserParam param,
  );

  Future<void> purchaseCableTV(
    PurchaseCableTvParam param,
  );

  Future<void> buyElectricity(
    BuyElectricityParam param,
  );

  Future<void> createWallet();
}

class WalletRemoteDataSourceImpl implements WalletRemoteDataSource {
  const WalletRemoteDataSourceImpl(this._client);
  final WalletClient _client;

  @override
  Future<dynamic> accountLookup(LookupAccountParam param) {
    return _client.accountLookup(param);
  }

  @override
  Future<void> buyElectricity(BuyElectricityParam param) {
    return _client.buyElectricity(param);
  }

  @override
  Future<void> createWallet() {
    return _client.createWallet(const CreateWalletParam());
  }

  @override
  Future<dynamic> getBanks() {
    return _client.getBanks();
  }

  @override
  Future<dynamic> getBillers(String type) {
    return _client.getBillers(type);
  }

  @override
  Future<dynamic> getCablePlans(String serviceType) {
    return _client.getCablePlans(
      GetBillerPlanParam(serviceType: serviceType),
    );
  }

  @override
  Future<dynamic> getProviderDataPlans(String billerId) {
    return _client.getProviderDataPlans(
      GetProviderDataParam(billerId: billerId),
    );
  }

  @override
  Future<dynamic> getTransaction() {
    return _client.getTransaction();
  }

  @override
  Future<dynamic> getTransactionDetails(String reference) {
    return _client.getTransactionDetails(reference);
  }

  @override
  Future<dynamic> getWalletInfo() {
    return _client.getWalletInfo();
  }

  @override
  Future<void> purchaseAirtime(PurchaseAirtimeParam param) {
    return _client.purchaseAirtime(param);
  }

  @override
  Future<void> purchaseCableTV(PurchaseCableTvParam param) {
    return _client.purchaseCableTV(param);
  }

  @override
  Future<void> sendMoney(SendMoneyParam param) {
    return _client.sendMoney(param);
  }

  @override
  Future<dynamic> validateBillPaymentUSer(ValidateBillPaymentUserParam param) {
    return _client.validateBillPaymentUSer(param);
  }
}
