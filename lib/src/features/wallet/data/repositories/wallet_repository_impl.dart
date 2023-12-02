import 'package:hr56_staff/src/core/error/failure.dart';
import 'package:hr56_staff/src/core/extensions/extensions.dart';
import 'package:hr56_staff/src/core/utils/either.dart';
import 'package:hr56_staff/src/features/wallet/data/data_sources/wallet_remote_data_source.dart';
import 'package:hr56_staff/src/features/wallet/data/models/biller/biller.dart';
import 'package:hr56_staff/src/features/wallet/data/models/biller_plan/cable_plan.dart';
import 'package:hr56_staff/src/features/wallet/data/models/buy_electricity/buy_electricity_param.dart';
import 'package:hr56_staff/src/features/wallet/data/models/look_up_account/look_up_account_model.dart';
import 'package:hr56_staff/src/features/wallet/data/models/look_up_account/look_up_account_param.dart';
import 'package:hr56_staff/src/features/wallet/data/models/provider_data_plan/provider_data_plan.dart';
import 'package:hr56_staff/src/features/wallet/data/models/purchase_airtime/purchase_airtime_param.dart';
import 'package:hr56_staff/src/features/wallet/data/models/purchase_cable_tv/purchase_cable_tv_param.dart';
import 'package:hr56_staff/src/features/wallet/data/models/send_money/send_money_param.dart';
import 'package:hr56_staff/src/features/wallet/data/models/validate_bill_payment_user/bill_payment_user_info.dart';
import 'package:hr56_staff/src/features/wallet/data/models/validate_bill_payment_user/validate_bill_payment_user_param.dart';
import 'package:hr56_staff/src/features/wallet/data/models/wallet/wallet.dart';
import 'package:hr56_staff/src/features/wallet/data/models/wallet_bank/wallet_bank.dart';
import 'package:hr56_staff/src/features/wallet/domain/repositories/wallet_repository.dart';

class WalletRepositoryImpl implements WalletRepository {
  const WalletRepositoryImpl(this._remoteDataSource);
  final WalletRemoteDataSource _remoteDataSource;

  @override
  Future<Either<Failure, LookupAccountModel?>> accountLookup(
    LookupAccountParam param,
  ) {
    return _remoteDataSource.accountLookup(param).makeRequest();
  }

  @override
  Future<Either<Failure, void>> buyElectricity(BuyElectricityParam param) {
    return _remoteDataSource.buyElectricity(param).makeRequest();
  }

  @override
  Future<Either<Failure, void>> createWallet() {
    return _remoteDataSource.createWallet().makeRequest();
  }

  @override
  Future<Either<Failure, List<WalletBank>>> getBanks() {
    return _remoteDataSource.getBanks().makeRequest();
  }

  @override
  Future<Either<Failure, List<Biller>>> getBillers(String type) {
    return _remoteDataSource.getBillers(type).makeRequest();
  }

  @override
  Future<Either<Failure, List<CablePlan>>> getCablePlans(String serviceType) {
    return _remoteDataSource.getCablePlans(serviceType).makeRequest();
  }

  @override
  Future<Either<Failure, List<ProviderDataPlan>>> getProviderDataPlans(
    String billerId,
  ) {
    return _remoteDataSource.getProviderDataPlans(billerId).makeRequest();
  }

  @override
  Future<Either<Failure, dynamic>> getTransaction() {
    return _remoteDataSource.getTransaction().makeRequest();
  }

  @override
  Future<Either<Failure, dynamic>> getTransactionDetails(String reference) {
    return _remoteDataSource.getTransactionDetails(reference).makeRequest();
  }

  @override
  Future<Either<Failure, Wallet?>> getWalletInfo() {
    return _remoteDataSource.getWalletInfo().makeRequest();
  }

  @override
  Future<Either<Failure, void>> purchaseAirtime(PurchaseAirtimeParam param) {
    return _remoteDataSource.purchaseAirtime(param).makeRequest();
  }

  @override
  Future<Either<Failure, void>> purchaseCableTV(PurchaseCableTvParam param) {
    return _remoteDataSource.purchaseCableTV(param).makeRequest();
  }

  @override
  Future<Either<Failure, void>> sendMoney(SendMoneyParam param) {
    return _remoteDataSource.sendMoney(param).makeRequest();
  }

  @override
  Future<Either<Failure, BillPaymentUserInfo?>> validateBillPaymentUSer(
    ValidateBillPaymentUserParam param,
  ) {
    return _remoteDataSource.validateBillPaymentUSer(param).makeRequest();
  }
}
