import 'package:hr56_staff/src/core/error/failure.dart';
import 'package:hr56_staff/src/core/utils/either.dart';
import 'package:hr56_staff/src/features/wallet/data/models/biller/biller.dart';
import 'package:hr56_staff/src/features/wallet/data/models/biller_plan/cable_plan.dart';
import 'package:hr56_staff/src/features/wallet/data/models/buy_electricity/buy_electricity_param.dart';
import 'package:hr56_staff/src/features/wallet/data/models/create_transaction_pin/create_transaction_pin_param.dart';
import 'package:hr56_staff/src/features/wallet/data/models/look_up_account/look_up_account_model.dart';
import 'package:hr56_staff/src/features/wallet/data/models/look_up_account/look_up_account_param.dart';
import 'package:hr56_staff/src/features/wallet/data/models/provider_data_plan/provider_data_plan.dart';
import 'package:hr56_staff/src/features/wallet/data/models/purchase_airtime/purchase_airtime_param.dart';
import 'package:hr56_staff/src/features/wallet/data/models/purchase_cable_tv/purchase_cable_tv_param.dart';
import 'package:hr56_staff/src/features/wallet/data/models/send_money/send_money_param.dart';
import 'package:hr56_staff/src/features/wallet/data/models/transaction/transaction.dart';
import 'package:hr56_staff/src/features/wallet/data/models/validate_bill_payment_user/bill_payment_user_info.dart';
import 'package:hr56_staff/src/features/wallet/data/models/validate_bill_payment_user/validate_bill_payment_user_param.dart';
import 'package:hr56_staff/src/features/wallet/data/models/wallet/wallet.dart';
import 'package:hr56_staff/src/features/wallet/data/models/wallet_bank/wallet_bank.dart';

abstract class WalletRepository {
  Future<Either<Failure, List<Transaction>>> getTransaction();

  Future<Either<Failure, dynamic>> getTransactionDetails(
    String reference,
  );

  Future<Either<Failure, Wallet?>> getWalletInfo();

  Future<Either<Failure, void>> sendMoney(
    SendMoneyParam param,
  );

  Future<Either<Failure, List<WalletBank>>> getBanks();

  Future<Either<Failure, LookupAccountModel?>> accountLookup(
    LookupAccountParam param,
  );

  Future<Either<Failure, List<Biller>>> getBillers(
    String type,
  );

  Future<Either<Failure, List<ProviderDataPlan>>> getProviderDataPlans(
    String billerId,
  );

  Future<Either<Failure, List<CablePlan>>> getCablePlans(
    String serviceType,
  );

  Future<Either<Failure, void>> purchaseAirtime(
    PurchaseAirtimeParam param,
  );

  Future<Either<Failure, BillPaymentUserInfo?>> validateBillPaymentUSer(
    ValidateBillPaymentUserParam param,
  );

  Future<Either<Failure, void>> purchaseCableTV(
    PurchaseCableTvParam param,
  );

  Future<Either<Failure, void>> buyElectricity(
    BuyElectricityParam param,
  );

  Future<Either<Failure, void>> createWallet();
  
  Future<Either<Failure, void>> createTransactionPIN(
    CreateTransactionPinParam param,
  );
}
