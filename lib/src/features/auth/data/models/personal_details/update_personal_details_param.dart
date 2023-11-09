// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_personal_details_param.freezed.dart';
part 'update_personal_details_param.g.dart';

@freezed
class UpdatePersonalDetailsParam with _$UpdatePersonalDetailsParam {
  const factory UpdatePersonalDetailsParam({
    @JsonKey(name: 'phone_number') String? phoneNumber,
    @JsonKey(name: 'alternative_phone_number') String? alternativePhoneNumber,
    @JsonKey(name: 'date_of_birth') String? dateOfBirth,
    @JsonKey(name: 'gender') String? gender,
    @JsonKey(name: 'marital_status') String? maritalStatus,
    @JsonKey(name: 'residential_address') String? residentialAddress,
    @JsonKey(name: 'state_id') String? stateId,
    @JsonKey(name: 'mode_of_identification') String? modeOfIdentification,
    @JsonKey(name: 'mode_of_identification_number')
    String? modeOfIdentificationNumber,
    @JsonKey(name: 'spouse_address') String? spouseAddress,
    @JsonKey(name: 'spouse_phone_number') String? spousePhoneNumber,
    @JsonKey(name: 'spouse_name') String? spouseName,
    @JsonKey(name: 'spouse_email_address') String? spouseEmailAddress,
  }) = _UpdatePersonalDetailsParam;

  factory UpdatePersonalDetailsParam.fromJson(Map<String, dynamic> json) =>
      _$UpdatePersonalDetailsParamFromJson(json);
}
