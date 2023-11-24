import 'package:hr56_staff/src/core/error/failure.dart';
import 'package:hr56_staff/src/core/utils/either.dart';
import 'package:hr56_staff/src/features/wallet/data/models/buy_electricity/buy_electricity_param.dart';
import 'package:hr56_staff/src/features/wallet/data/models/look_up_account/look_up_account_param.dart';
import 'package:hr56_staff/src/features/wallet/data/models/purchase_airtime/purchase_airtime_param.dart';
import 'package:hr56_staff/src/features/wallet/data/models/purchase_cable_tv/purchase_cable_tv_param.dart';
import 'package:hr56_staff/src/features/wallet/data/models/send_money/send_money_param.dart';
import 'package:hr56_staff/src/features/wallet/data/models/validate_bill_payment_user/validate_bill_payment_user_param.dart';

abstract class WalletRepository {
  
  Future<Either<Failure, dynamic>> getTransaction();

  Future<Either<Failure, dynamic>> getTransactionDetails(
    String reference,
  );

  Future<Either<Failure, dynamic>> getWalletInfo();

  Future<Either<Failure, void>> sendMoney(
    SendMoneyParam param,
  );

  Future<Either<Failure, dynamic>> getBanks();

  Future<Either<Failure, dynamic>> accountLookup(
    LookupAccountParam param,
  );

  Future<Either<Failure, dynamic>> getBillers(
    String type,
  );

  Future<Either<Failure, dynamic>> getProviderDataPlans(
    String billerId,
  );

  Future<Either<Failure, dynamic>> getCablePlans(
    String serviceType,
  );

  Future<Either<Failure, void>> purchaseAirtime(
    PurchaseAirtimeParam param,
  );

  Future<Either<Failure, dynamic>> validateBillPaymentUSer(
    ValidateBillPaymentUserParam param,
  );

  Future<Either<Failure, void>> purchaseCableTV(
    PurchaseCableTvParam param,
  );

  Future<Either<Failure, void>> buyElectricity(
    BuyElectricityParam param,
  );

  Future<Either<Failure, void>> createWallet();
}
