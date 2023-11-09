import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hr56_staff/src/core/enums/enums.dart';
import 'package:hr56_staff/src/features/auth/data/models/add_bank_details/add_bank_details_param.dart';
import 'package:hr56_staff/src/features/auth/data/models/add_emergency_contact/add_emergency_contact_param.dart';
import 'package:hr56_staff/src/features/auth/data/models/add_guarantor/add_guarantor_param.dart';
import 'package:hr56_staff/src/features/auth/data/models/add_reference/add_reference_param.dart';
import 'package:hr56_staff/src/features/auth/data/models/login/login_param.dart';
import 'package:hr56_staff/src/features/auth/data/models/next_of_kin/next_of_kin_param.dart';
import 'package:hr56_staff/src/features/auth/data/models/personal_details/update_personal_details_param.dart';
import 'package:hr56_staff/src/features/auth/domain/use_cases/add_bank_details_use_case.dart';
import 'package:hr56_staff/src/features/auth/domain/use_cases/add_emergency_contact_use_case.dart';
import 'package:hr56_staff/src/features/auth/domain/use_cases/add_guarantor_use_case.dart';
import 'package:hr56_staff/src/features/auth/domain/use_cases/add_next_of_kin_use_case.dart';
import 'package:hr56_staff/src/features/auth/domain/use_cases/add_reference_use_case.dart';
import 'package:hr56_staff/src/features/auth/domain/use_cases/login_use_case.dart';
import 'package:hr56_staff/src/features/auth/domain/use_cases/update_personal_info_use_case.dart';
import 'package:hr56_staff/src/services/user_storage_service.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';
part 'authentication_bloc.freezed.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc(
    this._loginUseCase,
    this._addBankDetailsUseCase,
    this._addEmergencyContactUseCase,
    this._addGuarantorUseCase,
    this._addReferenceUseCase,
    this._addNextOfKinUseCase,
    this._updatePersonalInfoUseCase,
    this._userStorageService,
  ) : super(const _Initial()) {
    on<_Login>(_onLogin);
    on<_AddBankDetails>(_onAddBankDetails);
    on<_AddEmergencyContact>(_onAddEmergencyContact);
    on<_AddGuarantor>(_onAddGuarantor);
    on<_AddReference>(_onAddReference);
    on<_AddNextOfKin>(_onAddNextOfKin);
    on<_UpdatePersonalInfo>(_onUpdatePersonalInfo);
  }

  final LoginUseCase _loginUseCase;
  final AddBankDetailsUseCase _addBankDetailsUseCase;
  final AddEmergencyContactUseCase _addEmergencyContactUseCase;
  final AddGuarantorUseCase _addGuarantorUseCase;
  final AddReferenceUseCase _addReferenceUseCase;
  final AddNextOfKinUseCase _addNextOfKinUseCase;
  final UpdatePersonalInfoUseCase _updatePersonalInfoUseCase;
  final UserStorageService _userStorageService;

  FutureOr<void> _onLogin(
    _Login event,
    Emitter<AuthenticationState> emit,
  ) async {
    emit(state.copyWith(viewState: ViewState.processing));
    final result = await _loginUseCase(event.param);
    result.fold(
      (error) => emit(
        state.copyWith(
          viewState: ViewState.error,
          errorMessage: error.message,
        ),
      ),
      (_) => emit(
        state.copyWith(
          viewState: ViewState.success,
        ),
      ),
    );
    resetState(emit);
  }

  FutureOr<void> _onAddBankDetails(
    _AddBankDetails event,
    Emitter<AuthenticationState> emit,
  ) async {
    emit(state.copyWith(viewState: ViewState.processing));
    final result = await _addBankDetailsUseCase(event.param);
    result.fold(
      (error) => emit(
        state.copyWith(
          viewState: ViewState.error,
          errorMessage: error.message,
        ),
      ),
      (_) => emit(
        state.copyWith(
          viewState: ViewState.success,
        ),
      ),
    );
    resetState(emit);
  }

  FutureOr<void> _onAddEmergencyContact(
    _AddEmergencyContact event,
    Emitter<AuthenticationState> emit,
  ) async {
    emit(state.copyWith(viewState: ViewState.processing));
    final result = await _addEmergencyContactUseCase(event.param);
    result.fold(
      (error) => emit(
        state.copyWith(
          viewState: ViewState.error,
          errorMessage: error.message,
        ),
      ),
      (_) => emit(
        state.copyWith(
          viewState: ViewState.success,
        ),
      ),
    );
    resetState(emit);
  }

  FutureOr<void> _onAddGuarantor(
    _AddGuarantor event,
    Emitter<AuthenticationState> emit,
  ) async {
    emit(state.copyWith(viewState: ViewState.processing));
    final result = await _addGuarantorUseCase(event.param);
    result.fold(
      (error) => emit(
        state.copyWith(
          viewState: ViewState.error,
          errorMessage: error.message,
        ),
      ),
      (_) => emit(
        state.copyWith(
          viewState: ViewState.success,
        ),
      ),
    );
    resetState(emit);
  }

  FutureOr<void> _onAddReference(
    _AddReference event,
    Emitter<AuthenticationState> emit,
  ) async {
    emit(state.copyWith(viewState: ViewState.processing));
    final result = await _addReferenceUseCase(event.param);
    result.fold(
      (error) => emit(
        state.copyWith(
          viewState: ViewState.error,
          errorMessage: error.message,
        ),
      ),
      (_) => emit(
        state.copyWith(
          viewState: ViewState.success,
        ),
      ),
    );
    resetState(emit);
  }

  FutureOr<void> _onAddNextOfKin(
    _AddNextOfKin event,
    Emitter<AuthenticationState> emit,
  ) async {
    emit(state.copyWith(viewState: ViewState.processing));
    final result = await _addNextOfKinUseCase(event.param);
    result.fold(
      (error) => emit(
        state.copyWith(
          viewState: ViewState.error,
          errorMessage: error.message,
        ),
      ),
      (_) => emit(
        state.copyWith(
          viewState: ViewState.success,
        ),
      ),
    );
    resetState(emit);
  }

  FutureOr<void> _onUpdatePersonalInfo(
    _UpdatePersonalInfo event,
    Emitter<AuthenticationState> emit,
  ) async {
    emit(state.copyWith(viewState: ViewState.processing));
    final result = await _updatePersonalInfoUseCase(
      UpdatePersonalInfoParams(
        id: _userStorageService.user?.personalInformationId?.toString() ?? '',
        param: event.param,
      ),
    );
    result.fold(
      (error) => emit(
        state.copyWith(
          viewState: ViewState.error,
          errorMessage: error.message,
        ),
      ),
      (_) => emit(
        state.copyWith(
          viewState: ViewState.success,
        ),
      ),
    );
    resetState(emit);
  }

  void resetState(
    Emitter<AuthenticationState> emit,
  ) {
    emit(const _Initial());
  }
}
