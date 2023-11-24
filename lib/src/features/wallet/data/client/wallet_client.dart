import 'package:dio/dio.dart';
import 'package:hr56_staff/src/features/wallet/data/models/biller_plan/get_biller_plan_param.dart';
import 'package:hr56_staff/src/features/wallet/data/models/buy_electricity/buy_electricity_param.dart';
import 'package:hr56_staff/src/features/wallet/data/models/create_wallet/create_wallet_param.dart';
import 'package:hr56_staff/src/features/wallet/data/models/look_up_account/look_up_account_param.dart';
import 'package:hr56_staff/src/features/wallet/data/models/provider_data_plan/get_provider_data_param.dart';
import 'package:hr56_staff/src/features/wallet/data/models/purchase_airtime/purchase_airtime_param.dart';
import 'package:hr56_staff/src/features/wallet/data/models/purchase_cable_tv/purchase_cable_tv_param.dart';
import 'package:hr56_staff/src/features/wallet/data/models/send_money/send_money_param.dart';
import 'package:hr56_staff/src/features/wallet/data/models/validate_bill_payment_user/validate_bill_payment_user_param.dart';
import 'package:retrofit/retrofit.dart';

part 'wallet_client.g.dart';

@RestApi()
abstract class WalletClient {
  factory WalletClient(Dio dio, {String baseUrl}) = _WalletClient;

  @GET('transaction')
  Future<dynamic> getTransaction();

  @GET('transaction?reference={reference}')
  Future<dynamic> getTransactionDetails(
    @Path('reference') String reference,
  );

  @GET('transaction/getWallet')
  Future<dynamic> getWalletInfo();

  @POST('transaction/sendMoney')
  Future<void> sendMoney(
    @Body() SendMoneyParam param,
  );

  @GET('transaction/getBanks')
  Future<dynamic> getBanks();

  @POST('transaction/accountLookup')
  Future<dynamic> accountLookup(
    @Body() LookupAccountParam param,
  );

  @GET('billpayment/getBillers?type={type}')
  Future<dynamic> getBillers(
    @Path('type') String type,
  );

  @POST('billpayment/data/plans')
  Future<dynamic> getProviderDataPlans(
    @Body() GetProviderDataParam param,
  );

  @POST('billpayment/cable/plans')
  Future<dynamic> getCablePlans(
    @Body() GetBillerPlanParam param,
  );

  @POST('billpayment/buyAirtime')
  Future<void> purchaseAirtime(
    @Body() PurchaseAirtimeParam param,
  );

  @POST('billpayment/validateUser')
  Future<dynamic> validateBillPaymentUSer(
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
}
