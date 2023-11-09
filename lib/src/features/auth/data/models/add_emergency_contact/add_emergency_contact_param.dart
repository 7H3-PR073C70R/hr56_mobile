// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_emergency_contact_param.freezed.dart';
part 'add_emergency_contact_param.g.dart';

@freezed
class AddEmergencyContactParam with _$AddEmergencyContactParam {
  const factory AddEmergencyContactParam({
    @JsonKey(name: 'first_name') String? firstName,
    @JsonKey(name: 'last_name') String? lastName,
    @JsonKey(name: 'middle_name') String? middleName,
    @JsonKey(name: 'phone_number') String? phoneNumber,
    @JsonKey(name: 'address') String? address,
    @JsonKey(name: 'email_address') String? emailAddress,
    @JsonKey(name: 'relationship') String? relationship,
    @JsonKey(name: 'second_first_name') String? secondFirstName,
    @JsonKey(name: 'second_last_name') String? secondLastName,
    @JsonKey(name: 'second_middle_name') String? secondMiddleName,
    @JsonKey(name: 'second_phone_number') String? secondPhoneNumber,
    @JsonKey(name: 'second_address') String? secondAddress,
    @JsonKey(name: 'second_email_address') String? secondEmailAddress,
    @JsonKey(name: 'second_relationship') String? secondRelationship,
  }) = _AddEmergencyContactParam;

  factory AddEmergencyContactParam.fromJson(Map<String, dynamic> json) =>
      _$AddEmergencyContactParamFromJson(json);
}
