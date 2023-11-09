import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hr56_staff/src/core/utils/use_case.dart';
import 'package:hr56_staff/src/features/auth/data/models/bank/bank.dart';
import 'package:hr56_staff/src/features/auth/data/models/hospital/hospital.dart';
import 'package:hr56_staff/src/features/auth/data/models/pension_admin/pension_admin.dart';
import 'package:hr56_staff/src/features/auth/data/models/state_response/state_response.dart';
import 'package:hr56_staff/src/features/auth/domain/use_cases/get_banks_use_case.dart';
import 'package:hr56_staff/src/features/auth/domain/use_cases/get_hospital_use_case.dart';
import 'package:hr56_staff/src/features/auth/domain/use_cases/get_pension_admin_use_case.dart';
import 'package:hr56_staff/src/features/auth/domain/use_cases/get_state_use_case.dart';

part 'app_event.dart';
part 'app_state.dart';
part 'app_bloc.freezed.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc(
    this._getBanksUseCase,
    this._getHospitalUseCase,
    this._getPensionAdminsUseCase,
    this._getStateUseCase,
  ) : super(const _Initial()) {
    on<_Started>(_onStarted);
  }

  final GetBanksUseCase _getBanksUseCase;
  final GetHospitalUseCase _getHospitalUseCase;
  final GetPensionAdminsUseCase _getPensionAdminsUseCase;
  final GetStateUseCase _getStateUseCase;

  FutureOr<void> _onStarted(_Started event, Emitter<AppState> emit) async {
    final banksResponse = await _getBanksUseCase(NoParams());
    final hospitalResponse = await _getHospitalUseCase(NoParams());
    final pensionAdminsResponse = await _getPensionAdminsUseCase(NoParams());
    final stateResponse = await _getStateUseCase(NoParams());

    emit(
      state.copyWith(
        banks: banksResponse.fold(
          (_) => [],
          (banks) => banks
            ..sort(
              (a, b) => (a.bankName ?? '').compareTo(b.bankName ?? ''),
            ),
        ),
        hospitals: hospitalResponse.fold(
          (_) => [],
          (hospitals) => hospitals
            ..sort(
              (a, b) => (a.hospitalName ?? '').compareTo(b.hospitalName ?? ''),
            ),
        ),
        pensionAdmins: pensionAdminsResponse.fold(
          (_) => [],
          (pensionAdmins) => pensionAdmins
            ..sort(
              (a, b) => (a.pensionAdminName ?? '')
                  .compareTo(b.pensionAdminName ?? ''),
            ),
        ),
        states: stateResponse.fold(
          (_) => [],
          (states) => states
            ..sort(
              (a, b) => (a.name ?? '').compareTo(b.name ?? ''),
            ),
        ),
      ),
    );
  }
}
