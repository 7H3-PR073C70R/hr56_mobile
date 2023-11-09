import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hr56_staff/src/core/constants/app_env.dart';
import 'package:hr56_staff/src/core/networking/interceptors/dio_interceptors.dart';
import 'package:hr56_staff/src/features/auth/data/client/auth_client.dart';
import 'package:hr56_staff/src/features/auth/data/data_sources/authentication_remote_datasource.dart';
import 'package:hr56_staff/src/features/auth/data/repositories/authentication_repository_impl.dart';
import 'package:hr56_staff/src/features/auth/domain/repositories/authentication_repository.dart';
import 'package:hr56_staff/src/features/auth/domain/use_cases/add_bank_details_use_case.dart';
import 'package:hr56_staff/src/features/auth/domain/use_cases/add_emergency_contact_use_case.dart';
import 'package:hr56_staff/src/features/auth/domain/use_cases/add_guarantor_use_case.dart';
import 'package:hr56_staff/src/features/auth/domain/use_cases/add_next_of_kin_use_case.dart';
import 'package:hr56_staff/src/features/auth/domain/use_cases/add_reference_use_case.dart';
import 'package:hr56_staff/src/features/auth/domain/use_cases/get_banks_use_case.dart';
import 'package:hr56_staff/src/features/auth/domain/use_cases/get_hospital_use_case.dart';
import 'package:hr56_staff/src/features/auth/domain/use_cases/get_pension_admin_use_case.dart';
import 'package:hr56_staff/src/features/auth/domain/use_cases/get_state_use_case.dart';
import 'package:hr56_staff/src/features/auth/domain/use_cases/login_use_case.dart';
import 'package:hr56_staff/src/features/auth/domain/use_cases/update_personal_info_use_case.dart';
import 'package:hr56_staff/src/features/auth/presentation/blocs/authentication_bloc.dart';
import 'package:hr56_staff/src/services/local_storage.dart';
import 'package:hr56_staff/src/services/user_storage_service.dart';
import 'package:logger/logger.dart';

part 'client_locator.dart';
part 'data_source_locator.dart';
part 'external_locator.dart';
part 'repository_locator.dart';
part 'use_case_locator.dart';
part 'service_locator.dart';
part 'bloc_locator.dart';

final locator = GetIt.instance;

void initLocator() {
  _initExternal();
  _initClients();
  _initDataSource();
  _initRepositoryLocator();
  _initUseCaseLocator();
  _initServices();
  _intiBloc();
}
