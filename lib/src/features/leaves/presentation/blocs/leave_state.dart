part of 'leave_bloc.dart';

@freezed
class LeaveState with _$LeaveState {
  const factory LeaveState.initial({
    @Default(ViewState.idle) ViewState viewState,
    @Default([]) List<LeaveModel> leaves,
    @Default([]) List<LeaveTypeModel> leaveTypes,
    LeaveModel? selectedLeave,
    LeaveTypeModel? selectedLeaveType,
    String? errorMessage,
  }) = _Initial;
}
