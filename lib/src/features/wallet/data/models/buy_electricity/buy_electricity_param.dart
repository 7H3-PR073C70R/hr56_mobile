import 'package:freezed_annotation/freezed_annotation.dart';

part 'buy_electricity_param.freezed.dart';
part 'buy_electricity_param.g.dart';

@freezed
class BuyElectricityParam with _$BuyElectricityParam {
  const factory BuyElectricityParam({
    required String billerId,
    required String billerName,
    required String customerNo,
    required String serviceCategory,
    required String amount,
    required String customerName,
    required String serviceType,
    required String customerAddress,
    required String notificationEmail,
    required String notificationPhone,
    required String pin,
  }) = _BuyElectricityParam;

  factory BuyElectricityParam.fromJson(Map<String, dynamic> json) =>
      _$BuyElectricityParamFromJson(json);
}
