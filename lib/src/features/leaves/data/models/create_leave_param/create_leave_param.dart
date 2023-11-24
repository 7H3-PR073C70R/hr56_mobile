// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_leave_param.freezed.dart';
part 'create_leave_param.g.dart';

@freezed
class CreateLeaveParam with _$CreateLeaveParam {
  const factory CreateLeaveParam({
    @JsonKey(name: 'start_date') required String startDate,
    @JsonKey(name: 'end_date') required String endDate,
    @JsonKey(name: 'specific_date_time') required String specificDateTime,
    @JsonKey(name: 'leave_type_id') required int leaveTypeId,
    @JsonKey(name: 'reliever_id') required int relieverId,
    @JsonKey(name: 'reason') required String reason,
    @JsonKey(name: 'attachment') required String attachment,
  }) = _CreateLeaveParam;

  factory CreateLeaveParam.fromJson(Map<String, dynamic> json) =>
      _$CreateLeaveParamFromJson(json);
}
