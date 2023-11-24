import 'package:hr56_staff/src/core/error/failure.dart';
import 'package:hr56_staff/src/core/extensions/extensions.dart';
import 'package:hr56_staff/src/core/utils/either.dart';
import 'package:hr56_staff/src/features/wallet/data/data_sources/wallet_remote_data_source.dart';
import 'package:hr56_staff/src/features/wallet/data/models/buy_electricity/buy_electricity_param.dart';
import 'package:hr56_staff/src/features/wallet/data/models/look_up_account/look_up_account_param.dart';
import 'package:hr56_staff/src/features/wallet/data/models/purchase_airtime/purchase_airtime_param.dart';
import 'package:hr56_staff/src/features/wallet/data/models/purchase_cable_tv/purchase_cable_tv_param.dart';
import 'package:hr56_staff/src/features/wallet/data/models/send_money/send_money_param.dart';
import 'package:hr56_staff/src/features/wallet/data/models/validate_bill_payment_user/validate_bill_payment_user_param.dart';
import 'package:hr56_staff/src/features/wallet/domain/repositories/wallet_repository.dart';

class WalletRepositoryImpl implements WalletRepository {
  const WalletRepositoryImpl(this._remoteDataSource);
  final WalletRemoteDataSource _remoteDataSource;

  @override
  Future<Either<Failure, dynamic>> accountLookup(LookupAccountParam param) {
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
  Future<Either<Failure, dynamic>> getBanks() {
    return _remoteDataSource.getBanks().makeRequest();
  }

  @override
  Future<Either<Failure, dynamic>> getBillers(String type) {
    return _remoteDataSource.getBillers(type).makeRequest();
  }

  @override
  Future<Either<Failure, dynamic>> getCablePlans(String serviceType) {
    return _remoteDataSource.getCablePlans(serviceType).makeRequest();
  }

  @override
  Future<Either<Failure, dynamic>> getProviderDataPlans(String billerId) {
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
  Future<Either<Failure, dynamic>> getWalletInfo() {
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
  Future<Either<Failure, dynamic>> validateBillPaymentUSer(
    ValidateBillPaymentUserParam param,
  ) {
    return _remoteDataSource.validateBillPaymentUSer(param).makeRequest();
  }
}
