// To parse this JSON data, do
//
//     final addBankDetailsParam = addBankDetailsParamFromJson(jsonString);

// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_bank_details_param.freezed.dart';
part 'add_bank_details_param.g.dart';

@freezed
class AddBankDetailsParam with _$AddBankDetailsParam {
  const factory AddBankDetailsParam({
    @JsonKey(name: 'bank_id') int? bankId,
    @JsonKey(name: 'account_number') String? accountNumber,
    @JsonKey(name: 'account_name') String? accountName,
    @JsonKey(name: 'nin') String? nin,
    @JsonKey(name: 'group_life_amount') int? groupLifeAmount,
    @JsonKey(name: 'pension_fund_admin_id') int? pensionFundAdminId,
    @JsonKey(name: 'pension_rsa_number') String? pensionRsaNumber,
  }) = _AddBankDetailsParam;

  factory AddBankDetailsParam.fromJson(Map<String, dynamic> json) =>
      _$AddBankDetailsParamFromJson(json);
}
