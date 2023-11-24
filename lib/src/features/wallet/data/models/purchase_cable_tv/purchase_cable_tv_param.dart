import 'package:freezed_annotation/freezed_annotation.dart';

part 'purchase_cable_tv_param.freezed.dart';
part 'purchase_cable_tv_param.g.dart';

@freezed
class PurchaseCableTvParam with _$PurchaseCableTvParam {
  const factory PurchaseCableTvParam({
    required String billerId,
    required String billerName,
    required String customerNo,
    required String serviceCategory,
    required String amount,
    required String paymentCode,
    required String customerName,
    required String billerCode,
  }) = _PurchaseCableTvParam;

  factory PurchaseCableTvParam.fromJson(Map<String, dynamic> json) =>
      _$PurchaseCableTvParamFromJson(json);
}
