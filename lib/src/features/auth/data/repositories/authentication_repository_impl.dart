import 'dart:io';

import 'package:hr56_staff/src/core/error/failure.dart';
import 'package:hr56_staff/src/core/extensions/extensions.dart';
import 'package:hr56_staff/src/core/utils/either.dart';
import 'package:hr56_staff/src/features/auth/data/data_sources/authentication_remote_datasource.dart';
import 'package:hr56_staff/src/features/auth/data/models/add_bank_details/add_bank_details_param.dart';
import 'package:hr56_staff/src/features/auth/data/models/add_emergency_contact/add_emergency_contact_param.dart';
import 'package:hr56_staff/src/features/auth/data/models/add_guarantor/add_guarantor_param.dart';
import 'package:hr56_staff/src/features/auth/data/models/add_reference/add_reference_param.dart';
import 'package:hr56_staff/src/features/auth/data/models/bank/bank.dart';
import 'package:hr56_staff/src/features/auth/data/models/hospital/hospital.dart';
import 'package:hr56_staff/src/features/auth/data/models/login/login_param.dart';
import 'package:hr56_staff/src/features/auth/data/models/login/login_response.dart';
import 'package:hr56_staff/src/features/auth/data/models/next_of_kin/next_of_kin_param.dart';
import 'package:hr56_staff/src/features/auth/data/models/pension_admin/pension_admin.dart';
import 'package:hr56_staff/src/features/auth/data/models/personal_details/update_personal_details_param.dart';
import 'package:hr56_staff/src/features/auth/data/models/state_response/state_response.dart';
import 'package:hr56_staff/src/features/auth/domain/repositories/authentication_repository.dart';
import 'package:hr56_staff/src/services/user_storage_service.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  const AuthenticationRepositoryImpl(
    this._datasource,
    this._userStorageService,
  );

  final AuthenticationRemoteDatasource _datasource;
  final UserStorageService _userStorageService;

  @override
  Future<Either<Failure, void>> addBankDetails(AddBankDetailsParam param) {
    return _datasource.addBankDetails(param).makeRequest();
  }

  @override
  Future<Either<Failure, void>> addEmergencyContact(
    AddEmergencyContactParam param,
  ) {
    return _datasource.addEmergencyContact(param).makeRequest();
  }

  @override
  Future<Either<Failure, void>> addGuarantor(
    AddGuarantorParam param,
    File? photo,
  ) {
    return _datasource.addGuarantor(param, photo).makeRequest();
  }

  @override
  Future<Either<Failure, void>> addNextOfKin(NextOfKinParam param) {
    return _datasource.addNextOfKin(param).makeRequest();
  }

  @override
  Future<Either<Failure, void>> addReference(AddReferenceParam param) {
    return _datasource.addReference(param).makeRequest();
  }

  @override
  Future<Either<Failure, LoginResponse>> login(LoginParam param) async {
    final result = await _datasource.login(param).makeRequest();

    if (result.isRight) {
      final loginResponse = result.fold((left) => null, (response) => response);
      _userStorageService
        ..saveToken(loginResponse!.token ?? '')
        ..saveUser(loginResponse.user);
    }

    return result;
  }

  @override
  Future<Either<Failure, void>> updatePersonalInfo({
    required String id,
    required UpdatePersonalDetailsParam param,
  }) {
    return _datasource.updatePersonalInfo(id: id, param: param).makeRequest();
  }

  @override
  Future<Either<Failure, List<Bank>>> getBanks() {
    return _datasource.getBanks().makeRequest();
  }

  @override
  Future<Either<Failure, List<Hospital>>> getHospitals() {
    return _datasource.getHospitals().makeRequest();
  }

  @override
  Future<Either<Failure, List<PensionAdmin>>> getPensionAdmins() {
    return _datasource.getPensionAdmins().makeRequest();
  }

  @override
  Future<Either<Failure, List<StateResponse>>> getStates() {
    return _datasource.getStates().makeRequest();
  }
}
