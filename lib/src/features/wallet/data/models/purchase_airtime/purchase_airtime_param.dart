import 'package:freezed_annotation/freezed_annotation.dart';

part 'purchase_airtime_param.freezed.dart';
part 'purchase_airtime_param.g.dart';

@freezed
class PurchaseAirtimeParam with _$PurchaseAirtimeParam {
  const factory PurchaseAirtimeParam({
    required String amount,
    required String billerName,
    required String billerCode,
    required String billerId,
    required String mobile,
    required String type,
    required String pin,
  }) = _PurchaseAirtimeParam;

  factory PurchaseAirtimeParam.fromJson(Map<String, dynamic> json) =>
      _$PurchaseAirtimeParamFromJson(json);
}
