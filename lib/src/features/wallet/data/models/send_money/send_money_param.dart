import 'package:freezed_annotation/freezed_annotation.dart';

part 'send_money_param.freezed.dart';
part 'send_money_param.g.dart';

@freezed
class SendMoneyParam with _$SendMoneyParam {
  const factory SendMoneyParam({
    required String amount,
    @Default('send') String? narration,
    required String type,
    required String account,
    required String bankCode,
    required String accountName,
  }) = _SendMoneyParam;

  factory SendMoneyParam.fromJson(Map<String, dynamic> json) =>
      _$SendMoneyParamFromJson(json);
}
