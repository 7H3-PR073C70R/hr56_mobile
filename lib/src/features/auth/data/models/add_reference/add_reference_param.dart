// To parse this JSON data, do
//
//     final addReferenceParam = addReferenceParamFromJson(jsonString);

// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_reference_param.freezed.dart';
part 'add_reference_param.g.dart';

@freezed
class AddReferenceParam with _$AddReferenceParam {
  const factory AddReferenceParam({
    @JsonKey(name: 'full_name') String? fullName,
    @JsonKey(name: 'address') String? address,
    @JsonKey(name: 'phone_number') String? phoneNumber,
    @JsonKey(name: 'company_name') String? companyName,
    @JsonKey(name: 'email_address') String? emailAddress,
    @JsonKey(name: 'job_role') String? jobRole,
    @JsonKey(name: 'department') String? department,
    @JsonKey(name: 'relationship') String? relationship,
  }) = _AddReferenceParam;

  factory AddReferenceParam.fromJson(Map<String, dynamic> json) =>
      _$AddReferenceParamFromJson(json);
}
