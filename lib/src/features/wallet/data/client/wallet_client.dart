import 'package:dio/dio.dart';
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
import 'package:retrofit/retrofit.dart';

part 'wallet_client.g.dart';

@RestApi()
abstract class WalletClient {
  factory WalletClient(Dio dio, {String baseUrl}) = _WalletClient;

  @GET('transaction')
  Future<List<Transaction>> getTransaction();

  @GET('transaction?reference={reference}')
  Future<dynamic> getTransactionDetails(
    @Path('reference') String reference,
  );

  @GET('transaction/getWallet')
  Future<Wallet?> getWalletInfo();

  @POST('transaction/sendMoney')
  Future<void> sendMoney(
    @Body() SendMoneyParam param,
  );

  @GET('transaction/getBanks')
  Future<List<WalletBank>> getBanks();

  @POST('transaction/accountLookup')
  Future<LookupAccountModel?> accountLookup(
    @Body() LookupAccountParam param,
  );

  @GET('billpayment/getBillers?type={type}')
  Future<List<Biller>> getBillers(
    @Path('type') String type,
  );

  @POST('billpayment/data/plans')
  Future<List<ProviderDataPlan>> getProviderDataPlans(
    @Body() GetProviderDataParam param,
  );

  @POST('billpayment/cable/plans')
  Future<List<CablePlan>> getCablePlans(
    @Body() GetBillerPlanParam param,
  );

  @POST('billpayment/buyAirtime')
  Future<void> purchaseAirtime(
    @Body() PurchaseAirtimeParam param,
  );

  @POST('billpayment/validateUser')
  Future<BillPaymentUserInfo?> validateBillPaymentUSer(
    @Body() ValidateBillPaymentUserParam param,
  );

  @POST('billpayment/buyCableTv')
  Future<void> purchaseCableTV(
    @Body() PurchaseCableTvParam param,
  );

  @POST('billpayment/buyElectricity')
  Future<void> buyElectricity(
    @Body() BuyElectricityParam param,
  );

  @POST('user/createWallet')
  Future<void> createWallet(
    @Body() CreateWalletParam param,
  );

  @POST('/transaction/setTransactionPin')
  Future<void> createTransactionPIN(
    @Body() CreateTransactionPinParam param,
  );
}
