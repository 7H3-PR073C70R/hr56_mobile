// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'appraisal.freezed.dart';
part 'appraisal.g.dart';

@freezed
class Appraisal with _$Appraisal {
  const factory Appraisal({
    @JsonKey(name: 'appraisal_user_id') String? appraisalUserId,
    @JsonKey(name: 'appraisal_title') String? appraisalTitle,
    @JsonKey(name: 'appraisal_type') String? appraisalType,
    @JsonKey(name: 'status') String? status,
    @JsonKey(name: 'total_score') String? totalScore,
    @JsonKey(name: 'created_at') String? createdAt,
  }) = _Appraisal;

  factory Appraisal.fromJson(Map<String, dynamic> json) =>
      _$AppraisalFromJson(json);
}
