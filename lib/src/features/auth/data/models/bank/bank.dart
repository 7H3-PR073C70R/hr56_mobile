// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'bank.freezed.dart';
part 'bank.g.dart';

@freezed
class Bank with _$Bank {
  const factory Bank({
    @JsonKey(name: 'bank_id') num? bankId,
    @JsonKey(name: 'bank_name') String? bankName,
    @JsonKey(name: 'bank_code') String? bankCode,
  }) = _Bank;

  factory Bank.fromJson(Map<String, dynamic> json) => _$BankFromJson(json);
}
