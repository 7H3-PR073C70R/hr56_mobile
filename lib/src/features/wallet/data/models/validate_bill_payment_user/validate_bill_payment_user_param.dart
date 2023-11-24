import 'package:freezed_annotation/freezed_annotation.dart';

part 'validate_bill_payment_user_param.freezed.dart';
part 'validate_bill_payment_user_param.g.dart';

@freezed
class ValidateBillPaymentUserParam with _$ValidateBillPaymentUserParam {
  const factory ValidateBillPaymentUserParam({
    required String billerId,
    required String productId,
    required String customerNo,
    required String serviceCategory,
    required String serviceType,
  }) = _ValidateBillPaymentUserParam;

  factory ValidateBillPaymentUserParam.fromJson(Map<String, dynamic> json) =>
      _$ValidateBillPaymentUserParamFromJson(json);
}
