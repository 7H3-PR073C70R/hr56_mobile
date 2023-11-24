import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hr56_staff/src/core/enums/enums.dart';
import 'package:hr56_staff/src/core/utils/use_case.dart';
import 'package:hr56_staff/src/features/leaves/data/models/create_leave_param/create_leave_param.dart';
import 'package:hr56_staff/src/features/leaves/data/models/leave_model/leave_model.dart';
import 'package:hr56_staff/src/features/leaves/data/models/leave_type/leave_type_model.dart';
import 'package:hr56_staff/src/features/leaves/domain/use_cases/create_leave_use_case.dart';
import 'package:hr56_staff/src/features/leaves/domain/use_cases/get_leave_type_use_case.dart';
import 'package:hr56_staff/src/features/leaves/domain/use_cases/get_leaves_use_case.dart';
import 'package:hr56_staff/src/features/leaves/domain/use_cases/update_leave_use_case.dart';

part 'leave_event.dart';
part 'leave_state.dart';
part 'leave_bloc.freezed.dart';

class LeaveBloc extends Bloc<LeaveEvent, LeaveState> {
  LeaveBloc(
    this._getLeaveUseCase,
    this._getLeaveTypeUseCase,
    this._createLeaveUseCase,
    this._updateLeaveUseCase,
  ) : super(const _Initial()) {
    on<_Started>(_onStarted);
    on<_SelectLeave>(_onSelectLeave);
    on<_SelectLeaveType>(_onSelectLeaveType);
    on<_CreateLeave>(_onCreateLeave);
    on<_UpdateLeave>(_onUpdateLeave);
  }

  final GetLeaveUseCase _getLeaveUseCase;
  final GetLeaveTypeUseCase _getLeaveTypeUseCase;
  final CreateLeaveUseCase _createLeaveUseCase;
  final UpdateLeaveUseCase _updateLeaveUseCase;

  FutureOr<void> _onStarted(_Started event, Emitter<LeaveState> emit) async {
    emit(state.copyWith(viewState: ViewState.processing));
    final leave = await _getLeaveUseCase.call(NoParams());
    final leaveType = await _getLeaveTypeUseCase.call(NoParams());
    emit(
      state.copyWith(
        viewState: ViewState.idle,
        leaves: leave.fold((_) => [], (leaves) => leaves),
        leaveTypes: leaveType.fold((_) => [], (leaveTypes) => leaveTypes),
      ),
    );
  }

  FutureOr<void> _onSelectLeave(_SelectLeave event, Emitter<LeaveState> emit) {
    emit(
      state.copyWith(selectedLeave: event.leave),
    );
  }

  FutureOr<void> _onSelectLeaveType(
    _SelectLeaveType event,
    Emitter<LeaveState> emit,
  ) {
    final selectedLeaveType = state.leaveTypes.firstWhere(
      (element) => element.name == event.type,
      orElse: LeaveTypeModel.new,
    );
    emit(
      state.copyWith(
        selectedLeaveType: selectedLeaveType.id == null
            ? state.selectedLeaveType
            : selectedLeaveType,
      ),
    );
  }

  FutureOr<void> _onCreateLeave(
    _CreateLeave event,
    Emitter<LeaveState> emit,
  ) async {
    emit(state.copyWith(viewState: ViewState.processing));
    final response = await _createLeaveUseCase.call(
      event.param,
    );

    response.fold(
      (error) => emit(
        state.copyWith(viewState: ViewState.error, errorMessage: error.message),
      ),
      (_) => emit(
        state.copyWith(
          viewState: ViewState.success,
        ),
      ),
    );
    emit(state.copyWith(viewState: ViewState.idle));
  }

  FutureOr<void> _onUpdateLeave(
    _UpdateLeave event,
    Emitter<LeaveState> emit,
  ) async {
    emit(state.copyWith(viewState: ViewState.processing));
    final response = await _updateLeaveUseCase.call(
      (
        (state.selectedLeave?.id ?? ''),
        event.param,
      ),
    );

    response.fold(
      (error) => emit(
        state.copyWith(viewState: ViewState.error, errorMessage: error.message),
      ),
      (_) => emit(
        state.copyWith(
          viewState: ViewState.success,
        ),
      ),
    );
    emit(state.copyWith(viewState: ViewState.idle));
  }
}
