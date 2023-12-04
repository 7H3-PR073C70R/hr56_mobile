import 'package:hr56_staff/src/features/wallet/data/client/wallet_client.dart';
import 'package:hr56_staff/src/features/wallet/data/models/biller/biller.dart';
import 'package:hr56_staff/src/features/wallet/data/models/biller_plan/cable_plan.dart';
import 'package:hr56_staff/src/features/wallet/data/models/biller_plan/get_biller_plan_param.dart';
import 'package:hr56_staff/src/features/wallet/data/models/buy_electricity/buy_electricity_param.dart';
import 'package:hr56_staff/src/features/wallet/data/models/create_transaction_pin/create_transaction_pin_param.dart';
import 'package:hr56_staff/src/features/wallet/data/models/create_wallet/create_wallet_param.dart';
import 'package:hr56_staff/src/features/wallet/data/models/look_up_account/look_up_account_model.dart';
import 'package:hr56_staff/src/features/wallet/data/models/look_up_account/look_up_account_param.dart';
import 'package:hr56_staff/src/features/wallet/data/models/provider_data_plan/get_provider_data_param.dart';
import 'package:hr56_staff/src/features/wallet/data/models/provider_data_plan/provider_data_plan.dart';
import 'package:hr56_staff/src/features/wallet/data/models/purchase_airtime/purchase_airtime_param.dart';
import 'package:hr56_staff/src/features/wallet/data/models/purchase_cable_tv/purchase_cable_tv_param.dart';
import 'package:hr56_staff/src/features/wallet/data/models/send_money/send_money_param.dart';
import 'package:hr56_staff/src/features/wallet/data/models/transaction/transaction.dart';
import 'package:hr56_staff/src/features/wallet/data/models/validate_bill_payment_user/bill_payment_user_info.dart';
import 'package:hr56_staff/src/features/wallet/data/models/validate_bill_payment_user/validate_bill_payment_user_param.dart';
import 'package:hr56_staff/src/features/wallet/data/models/wallet/wallet.dart';
import 'package:hr56_staff/src/features/wallet/data/models/wallet_bank/wallet_bank.dart';

abstract class WalletRemoteDataSource {
  Future<List<Transaction>> getTransaction();

  Future<dynamic> getTransactionDetails(
    String reference,
  );

  Future<Wallet?> getWalletInfo();

  Future<void> sendMoney(
    SendMoneyParam param,
  );

  Future<List<WalletBank>> getBanks();

  Future<LookupAccountModel?> accountLookup(
    LookupAccountParam param,
  );

  Future<List<Biller>> getBillers(
    String type,
  );

  Future<List<ProviderDataPlan>> getProviderDataPlans(
    String billerId,
  );

  Future<List<CablePlan>> getCablePlans(
    String serviceType,
  );

  Future<void> purchaseAirtime(
    PurchaseAirtimeParam param,
  );

  Future<BillPaymentUserInfo?> validateBillPaymentUSer(
    ValidateBillPaymentUserParam param,
  );

  Future<void> purchaseCableTV(
    PurchaseCableTvParam param,
  );

  Future<void> buyElectricity(
    BuyElectricityParam param,
  );

  Future<void> createWallet();

  Future<void> createTransactionPIN(
    CreateTransactionPinParam param,
  );
}

class WalletRemoteDataSourceImpl implements WalletRemoteDataSource {
  const WalletRemoteDataSourceImpl(this._client);
  final WalletClient _client;

  @override
  Future<LookupAccountModel?> accountLookup(LookupAccountParam param) {
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
  Future<List<WalletBank>> getBanks() {
    return _client.getBanks();
  }

  @override
  Future<List<Biller>> getBillers(String type) {
    return _client.getBillers(type);
  }

  @override
  Future<List<CablePlan>> getCablePlans(String serviceType) {
    return _client.getCablePlans(
      GetBillerPlanParam(serviceType: serviceType),
    );
  }

  @override
  Future<List<ProviderDataPlan>> getProviderDataPlans(String billerId) {
    return _client.getProviderDataPlans(
      GetProviderDataParam(billerId: billerId),
    );
  }

  @override
  Future<List<Transaction>> getTransaction() {
    return _client.getTransaction();
  }

  @override
  Future<dynamic> getTransactionDetails(String reference) {
    return _client.getTransactionDetails(reference);
  }

  @override
  Future<Wallet?> getWalletInfo() {
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
  Future<BillPaymentUserInfo?> validateBillPaymentUSer(
    ValidateBillPaymentUserParam param,
  ) {
    return _client.validateBillPaymentUSer(param);
  }

  @override
  Future<void> createTransactionPIN(CreateTransactionPinParam param) {
    return _client.createTransactionPIN(param);
  }
}
