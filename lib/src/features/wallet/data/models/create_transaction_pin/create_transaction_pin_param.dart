// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_transaction_pin_param.freezed.dart';
part 'create_transaction_pin_param.g.dart';

@freezed
class CreateTransactionPinParam with _$CreateTransactionPinParam {
  const factory CreateTransactionPinParam({
    required String pin,
    @JsonKey(name: 'pin_confirmation') required String pinConfirmation,
  }) = _CreateTransactionPinParam;

  factory CreateTransactionPinParam.fromJson(Map<String, dynamic> json) =>
      _$CreateTransactionPinParamFromJson(json);
}
