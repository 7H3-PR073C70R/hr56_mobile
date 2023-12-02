import 'package:freezed_annotation/freezed_annotation.dart';

part 'bill_payment_user_info.freezed.dart';
part 'bill_payment_user_info.g.dart';

@freezed
class BillPaymentUserInfo with _$BillPaymentUserInfo {
  const factory BillPaymentUserInfo({
    String? customerId,
    String? serviceType,
    String? serviceCategory,
    String? customerName,
    String? customerAccountName,
    ServiceCharges? serviceCharges,
    String? outStandingBalance,
    String? dueDate,
    String? currentBouquet,
    CurrentPlan? currentPlan,
  }) = _BillPaymentUserInfo;

  factory BillPaymentUserInfo.fromJson(Map<String, dynamic> json) =>
      _$BillPaymentUserInfoFromJson(json);
}

@freezed
class CurrentPlan with _$CurrentPlan {
  const factory CurrentPlan({
    List<PlanInfo>? planInfos,
    String? totalPlanAmount,
  }) = _CurrentPlan;

  factory CurrentPlan.fromJson(Map<String, dynamic> json) =>
      _$CurrentPlanFromJson(json);
}

@freezed
class PlanInfo with _$PlanInfo {
  const factory PlanInfo({
    String? planCode,
    String? planName,
    int? priceAmount,
    String? planDescription,
  }) = _PlanInfo;

  factory PlanInfo.fromJson(Map<String, dynamic> json) =>
      _$PlanInfoFromJson(json);
}

@freezed
class ServiceCharges with _$ServiceCharges {
  const factory ServiceCharges({
    String? transactionFeeAmount,
    List<dynamic>? transactionFees,
  }) = _ServiceCharges;

  factory ServiceCharges.fromJson(Map<String, dynamic> json) =>
      _$ServiceChargesFromJson(json);
}
