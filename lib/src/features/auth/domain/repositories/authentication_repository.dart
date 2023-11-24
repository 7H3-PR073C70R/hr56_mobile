import 'dart:io';

import 'package:hr56_staff/src/core/error/failure.dart';
import 'package:hr56_staff/src/core/utils/either.dart';
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

abstract class AuthenticationRepository {
  Future<Either<Failure, LoginResponse>> login(
    LoginParam param,
  );

  Future<Either<Failure, void>> addBankDetails(
    AddBankDetailsParam param,
  );

  Future<Either<Failure, void>> addEmergencyContact(
    AddEmergencyContactParam param,
  );

  Future<Either<Failure, void>> addGuarantor(
    AddGuarantorParam param,
    File? photo,
  );

  Future<Either<Failure, void>> addReference(
    AddReferenceParam param,
  );

  Future<Either<Failure, void>> addNextOfKin(
    NextOfKinParam param,
  );

  Future<Either<Failure, void>> updatePersonalInfo({
    required String id,
    required UpdatePersonalDetailsParam param,
  });

  Future<Either<Failure, List<Bank>>> getBanks();

  Future<Either<Failure, List<Hospital>>> getHospitals();

  Future<Either<Failure, List<PensionAdmin>>> getPensionAdmins();

  Future<Either<Failure, List<StateResponse>>> getStates();
}
