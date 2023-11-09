// To parse this JSON data, do
//
//     final addReferenceParam = addReferenceParamFromJson(jsonString);

// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_guarantor_param.freezed.dart';
part 'add_guarantor_param.g.dart';

@freezed
class AddGuarantorParam with _$AddGuarantorParam {
  const factory AddGuarantorParam({
    @JsonKey(name: 'first_name') String? firstname,
    @JsonKey(name: 'last_name') String? lastname,
    @JsonKey(name: 'middle_name') String? middleName,
    @JsonKey(name: 'phone_number') String? phoneNumber,
    @JsonKey(name: 'address') String? address,
    @JsonKey(name: 'occupation') String? occupation,
    @JsonKey(name: 'city') String? city,
    @JsonKey(name: 'state_id') String? stateId,
    @JsonKey(name: 'email_address') String? emailAddress,
    @JsonKey(name: 'relationship') String? relationship,
    @JsonKey(name: 'date_of_birth') String? dateOFBirth,
    @JsonKey(name: 'employer_name') String? employeeName,
    @JsonKey(name: 'employer_address') String? employeeAddress,
    @JsonKey(name: 'position_held') String? positionHeld,
    @JsonKey(name: 'marital_status') String? maritalStatus,
    @JsonKey(name: 'mean_of_identification') String? meanOfIdentification,
    @JsonKey(name: 'identification_number') String? identificationNumber,
    @JsonKey(name: 'issue_date') String? issueDate,
    @JsonKey(name: 'expire_date') String? expireDate,
    @JsonKey(name: 'annual_salary') String? annualSalary,
  }) = _AddReferenceParam;

  factory AddGuarantorParam.fromJson(Map<String, dynamic> json) =>
      _$AddGuarantorParamFromJson(json);
}
