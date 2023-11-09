part of 'authentication_bloc.dart';

@freezed
class AuthenticationEvent with _$AuthenticationEvent {
  const factory AuthenticationEvent.login(
    LoginParam param,
  ) = _Login;
  const factory AuthenticationEvent.addBankDetails(
    AddBankDetailsParam param,
  ) = _AddBankDetails;
  const factory AuthenticationEvent.addEmergencyContact(
    AddEmergencyContactParam param,
  ) = _AddEmergencyContact;
  const factory AuthenticationEvent.addGuarantor(
    AddGuarantorUseCaseParam param,
  ) = _AddGuarantor;
  const factory AuthenticationEvent.addReference(
    AddReferenceParam param,
  ) = _AddReference;
  const factory AuthenticationEvent.addNextOfKin(
    NextOfKinParam param,
  ) = _AddNextOfKin;
  const factory AuthenticationEvent.updatePersonalInfo({
    required UpdatePersonalDetailsParam param,
  }) = _UpdatePersonalInfo;
}
