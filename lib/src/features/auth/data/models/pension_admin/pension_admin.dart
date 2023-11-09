// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'pension_admin.freezed.dart';
part 'pension_admin.g.dart';

@freezed
class PensionAdmin with _$PensionAdmin {
  const factory PensionAdmin({
    @JsonKey(name: 'pension_fund_admin_id') num? pensionFundAdminId,
    @JsonKey(name: 'pension_admin_name') String? pensionAdminName,
    @JsonKey(name: 'pfa_code') String? pfaCode,
    @JsonKey(name: 'bank') String? bank,
  }) = _PensionAdmin;

  factory PensionAdmin.fromJson(Map<String, dynamic> json) =>
      _$PensionAdminFromJson(json);
}
