import 'dart:io';
import 'package:dio/dio.dart';
import 'package:hr56_staff/src/features/auth/data/client/auth_client.dart';
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
import 'package:http_parser/http_parser.dart';

abstract class AuthenticationRemoteDatasource {
  Future<LoginResponse> login(
    LoginParam param,
  );

  Future<void> addBankDetails(
    AddBankDetailsParam param,
  );

  Future<void> addEmergencyContact(
    AddEmergencyContactParam param,
  );

  Future<void> addGuarantor(
    AddGuarantorParam param,
    File? photo,
  );

  Future<void> addReference(
    AddReferenceParam param,
  );

  Future<void> addNextOfKin(
    NextOfKinParam param,
  );

  Future<void> updatePersonalInfo({
    required String id,
    required UpdatePersonalDetailsParam param,
  });

  Future<List<Bank>> getBanks();

  Future<List<Hospital>> getHospitals();

  Future<List<PensionAdmin>> getPensionAdmins();

  Future<List<StateResponse>> getStates();
}

class AuthenticationRemoteDatasourceImpl
    implements AuthenticationRemoteDatasource {
  const AuthenticationRemoteDatasourceImpl(this._client, this._dio);
  final AuthClient _client;
  final Dio _dio;

  @override
  Future<void> addBankDetails(AddBankDetailsParam param) {
    return _client.addBankDetails(param);
  }

  @override
  Future<void> addEmergencyContact(AddEmergencyContactParam param) {
    return _client.addEmergencyContact(param);
  }

  @override
  Future<void> addGuarantor(
    AddGuarantorParam param,
    File? photo,
  ) async {
    final formData = FormData.fromMap(
      {
        'photo': await MultipartFile.fromFile(
          photo!.path,
          filename: photo.path.split(Platform.pathSeparator).last,
          contentType: MediaType(
            'jpeg',
            'png',
          ),
        ),
      }..addAll(
          param.toJson(),
        ),
    );
    await _dio.post<dynamic>(
      '/guarantors',
      data: formData,
    );
    // return _client.addGuarantor(param.toJson()..addAll({'photo': photo}));
  }

  @override
  Future<void> addNextOfKin(NextOfKinParam param) {
    return _client.addNextOfKin(param);
  }

  @override
  Future<void> addReference(AddReferenceParam param) {
    return _client.addReference(param);
  }

  @override
  Future<LoginResponse> login(LoginParam param) {
    return _client.login(param);
  }

  @override
  Future<void> updatePersonalInfo({
    required String id,
    required UpdatePersonalDetailsParam param,
  }) {
    return _client.updatePersonalInfo(id, param);
  }

  @override
  Future<List<Bank>> getBanks() {
    return _client.getBanks();
  }

  @override
  Future<List<Hospital>> getHospitals() {
    return _client.getHospitals();
  }

  @override
  Future<List<PensionAdmin>> getPensionAdmins() {
    return _client.getPensionAdmins();
  }

  @override
  Future<List<StateResponse>> getStates() {
    return _client.getStates();
  }
}
