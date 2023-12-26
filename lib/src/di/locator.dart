import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hr56_staff/src/core/constants/app_env.dart';
import 'package:hr56_staff/src/core/networking/interceptors/dio_interceptors.dart';
import 'package:hr56_staff/src/features/appraisal/data/client/appraisal_client.dart';
import 'package:hr56_staff/src/features/appraisal/data/data_sources/appraisal_data_source.dart';
import 'package:hr56_staff/src/features/appraisal/data/repositories/appraisal_repository_impl.dart';
import 'package:hr56_staff/src/features/appraisal/domain/repositories/appraisal_repository.dart';
import 'package:hr56_staff/src/features/appraisal/domain/use_cases/get_appraisal_details_use_case.dart';
import 'package:hr56_staff/src/features/appraisal/domain/use_cases/get_appraisal_use_case.dart';
import 'package:hr56_staff/src/features/appraisal/domain/use_cases/submit_appraisal_use_case.dart';
import 'package:hr56_staff/src/features/appraisal/domain/use_cases/take_appraisal_use_case.dart';
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
import 'package:hr56_staff/src/features/leaves/data/client/leave_client.dart';
import 'package:hr56_staff/src/features/leaves/data/data_sources/leave_remote_data_source.dart';
import 'package:hr56_staff/src/features/leaves/data/repositories/leave_repository_impl.dart';
import 'package:hr56_staff/src/features/leaves/domain/repositories/leave_repository.dart';
import 'package:hr56_staff/src/features/leaves/domain/use_cases/create_leave_use_case.dart';
import 'package:hr56_staff/src/features/leaves/domain/use_cases/get_leave_type_use_case.dart';
import 'package:hr56_staff/src/features/leaves/domain/use_cases/get_leaves_use_case.dart';
import 'package:hr56_staff/src/features/leaves/domain/use_cases/update_leave_use_case.dart';
import 'package:hr56_staff/src/features/wallet/data/client/wallet_client.dart';
import 'package:hr56_staff/src/features/wallet/data/data_sources/wallet_remote_data_source.dart';
import 'package:hr56_staff/src/features/wallet/data/repositories/wallet_repository_impl.dart';
import 'package:hr56_staff/src/features/wallet/domain/repositories/wallet_repository.dart';
import 'package:hr56_staff/src/features/wallet/domain/use_cases/account_lookup_use_case.dart';
import 'package:hr56_staff/src/features/wallet/domain/use_cases/buy_electricity_use_case.dart';
import 'package:hr56_staff/src/features/wallet/domain/use_cases/create_transaction_pin_use_case.dart';
import 'package:hr56_staff/src/features/wallet/domain/use_cases/create_wallet_use_case.dart';
import 'package:hr56_staff/src/features/wallet/domain/use_cases/get_banks_use_case.dart';
import 'package:hr56_staff/src/features/wallet/domain/use_cases/get_billers_use_case.dart';
import 'package:hr56_staff/src/features/wallet/domain/use_cases/get_cable_plans_use_case.dart';
import 'package:hr56_staff/src/features/wallet/domain/use_cases/get_provider_data_plans_use_case.dart';
import 'package:hr56_staff/src/features/wallet/domain/use_cases/get_transaction_details_use_case.dart';
import 'package:hr56_staff/src/features/wallet/domain/use_cases/get_transactions_use_case.dart';
import 'package:hr56_staff/src/features/wallet/domain/use_cases/get_wallet_info_use_case.dart';
import 'package:hr56_staff/src/features/wallet/domain/use_cases/purchase_airtime_use_case.dart';
import 'package:hr56_staff/src/features/wallet/domain/use_cases/purchase_cable_tv_use_case.dart';
import 'package:hr56_staff/src/features/wallet/domain/use_cases/send_money_use_case.dart';
import 'package:hr56_staff/src/features/wallet/domain/use_cases/validate_bill_payment_user_use_case.dart';
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
