// To parse this JSON data, do
//
//     final nextOfKinParam = nextOfKinParamFromJson(jsonString);

// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'next_of_kin_param.freezed.dart';
part 'next_of_kin_param.g.dart';

@freezed
class NextOfKinParam with _$NextOfKinParam {
  const factory NextOfKinParam({
    @JsonKey(name: 'first_name') String? firstName,
    @JsonKey(name: 'last_name') String? lastName,
    @JsonKey(name: 'middle_name') String? middleName,
    @JsonKey(name: 'residential_address') String? residentialAddress,
    @JsonKey(name: 'phone_number') String? phoneNumber,
    @JsonKey(name: 'phone_number2') String? phoneNumber2,
    @JsonKey(name: 'email_address') String? emailAddress,
    @JsonKey(name: 'age') String? age,
    @JsonKey(name: 'relationship') String? relationship,
  }) = _NextOfKinParam;

  factory NextOfKinParam.fromJson(Map<String, dynamic> json) =>
      _$NextOfKinParamFromJson(json);
}
