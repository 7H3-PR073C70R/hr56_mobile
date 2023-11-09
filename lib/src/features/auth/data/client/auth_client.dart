import 'package:dio/dio.dart';
import 'package:hr56_staff/src/features/auth/data/models/add_bank_details/add_bank_details_param.dart';
import 'package:hr56_staff/src/features/auth/data/models/add_emergency_contact/add_emergency_contact_param.dart';
import 'package:hr56_staff/src/features/auth/data/models/add_reference/add_reference_param.dart';
import 'package:hr56_staff/src/features/auth/data/models/bank/bank.dart';
import 'package:hr56_staff/src/features/auth/data/models/hospital/hospital.dart';
import 'package:hr56_staff/src/features/auth/data/models/login/login_param.dart';
import 'package:hr56_staff/src/features/auth/data/models/login/login_response.dart';
import 'package:hr56_staff/src/features/auth/data/models/next_of_kin/next_of_kin_param.dart';
import 'package:hr56_staff/src/features/auth/data/models/pension_admin/pension_admin.dart';
import 'package:hr56_staff/src/features/auth/data/models/personal_details/update_personal_details_param.dart';
import 'package:hr56_staff/src/features/auth/data/models/state_response/state_response.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_client.g.dart';

@RestApi()
abstract class AuthClient {
  factory AuthClient(Dio dio, {String baseUrl}) = _AuthClient;

  @POST('/login')
  Future<LoginResponse> login(
    @Body() LoginParam param,
  );

  @POST('/financial-details')
  Future<void> addBankDetails(
    @Body() AddBankDetailsParam param,
  );

  @POST('/emergency-contacts')
  Future<void> addEmergencyContact(
    @Body() AddEmergencyContactParam param,
  );

  @POST('/guarantors')
  @MultiPart()
  Future<void> addGuarantor(
    @Path() Map<String, dynamic> param,
  );

  @POST('/references')
  Future<void> addReference(
    @Body() AddReferenceParam param,
  );

  @POST('/next-of-kin')
  Future<void> addNextOfKin(
    @Body() NextOfKinParam param,
  );

  @PUT('/personal-information/{id}')
  Future<void> updatePersonalInfo(
    @Path('id') String id,
    @Body() UpdatePersonalDetailsParam param,
  );

  @GET('/banks')
  Future<List<Bank>> getBanks();

  @GET('/hospitals')
  Future<List<Hospital>> getHospitals();

  @GET('/pension-fund-admins')
  Future<List<PensionAdmin>> getPensionAdmins();

  @GET('/states')
  Future<List<StateResponse>> getStates();
}
