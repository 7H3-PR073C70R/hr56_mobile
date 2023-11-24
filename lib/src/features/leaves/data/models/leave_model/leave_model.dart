// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'leave_model.freezed.dart';
part 'leave_model.g.dart';

@freezed
class LeaveModel with _$LeaveModel {
  const factory LeaveModel({
    @JsonKey(name: 'id') String? id,
    @JsonKey(name: 'start_date') String? startDate,
    @JsonKey(name: 'end_date') String? endDate,
    @JsonKey(name: 'reason') String? reason,
    @JsonKey(name: 'reliever_email') String? relieverEmail,
    @JsonKey(name: 'reliever_name') String? relieverName,
    @JsonKey(name: 'leave_type') String? leaveType,
    @JsonKey(name: 'duration') String? duration,
    @JsonKey(name: 'department') String? department,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'status') String? status,
    @JsonKey(name: 'attachment') String? attachment,
  }) = _LeaveModel;

  factory LeaveModel.fromJson(Map<String, dynamic> json) =>
      _$LeaveModelFromJson(json);
}
