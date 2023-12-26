// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'appraisal_details.freezed.dart';
part 'appraisal_details.g.dart';

@freezed
class AppraisalDetails with _$AppraisalDetails {
  const factory AppraisalDetails({
    @JsonKey(name: 'appraisal_user') AppraisalUser? appraisalUser,
    @JsonKey(name: 'responses') List<Response>? responses,
  }) = _AppraisalDetails;

  factory AppraisalDetails.fromJson(Map<String, dynamic> json) =>
      _$AppraisalDetailsFromJson(json);
}

@freezed
class AppraisalUser with _$AppraisalUser {
  const factory AppraisalUser({
    @JsonKey(name: 'appraisal_user_id') String? appraisalUserId,
    @JsonKey(name: 'appraisal_title') String? appraisalTitle,
    @JsonKey(name: 'appraisal_type') String? appraisalType,
    @JsonKey(name: 'status') String? status,
    @JsonKey(name: 'total_score') String? totalScore,
    @JsonKey(name: 'created_at') String? createdAt,
  }) = _AppraisalUser;

  factory AppraisalUser.fromJson(Map<String, dynamic> json) =>
      _$AppraisalUserFromJson(json);
}

@freezed
class Response with _$Response {
  const factory Response({
    @JsonKey(name: 'id') String? id,
    @JsonKey(name: 'appraisal_question') String? appraisalQuestion,
    @JsonKey(name: 'user_response') String? userResponse,
    @JsonKey(name: 'score') String? score,
  }) = _Response;

  factory Response.fromJson(Map<String, dynamic> json) =>
      _$ResponseFromJson(json);
}
