part of 'leave_bloc.dart';

@freezed
class LeaveEvent with _$LeaveEvent {
  const factory LeaveEvent.started() = _Started;
  const factory LeaveEvent.selectLeave(LeaveModel leave) = _SelectLeave;
  const factory LeaveEvent.selectLeaveType(String type) = _SelectLeaveType;
  const factory LeaveEvent.createLeave(CreateLeaveParam param) = _CreateLeave;
  const factory LeaveEvent.updateLeave(CreateLeaveParam param) = _UpdateLeave;
}
