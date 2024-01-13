// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'appraisal_questionnaire.freezed.dart';
part 'appraisal_questionnaire.g.dart';

@freezed
class AppraisalQuestionnaire with _$AppraisalQuestionnaire {
  const factory AppraisalQuestionnaire({
    @JsonKey(name: 'appraisal_name') String? appraisalName,
    @JsonKey(name: 'appraisal_questions')
    List<AppraisalQuestion>? appraisalQuestions,
  }) = _AppraisalQuestionnaire;

  factory AppraisalQuestionnaire.fromJson(Map<String, dynamic> json) =>
      _$AppraisalQuestionnaireFromJson(json);
}

@freezed
class AppraisalQuestion with _$AppraisalQuestion {
  const factory AppraisalQuestion({
    @JsonKey(name: 'appraisal_question_id') int? appraisalQuestionId,
    @JsonKey(name: 'appraisal_question') String? appraisalQuestion,
    @JsonKey(name: 'question_type') String? questionType,
    @JsonKey(name: 'optiona') String? optiona,
    @JsonKey(name: 'optionb') String? optionb,
    @JsonKey(name: 'optionc') String? optionc,
    @JsonKey(name: 'optiond') String? optiond,
    @JsonKey(name: 'optione') String? optione,
  }) = _AppraisalQuestion;

  factory AppraisalQuestion.fromJson(Map<String, dynamic> json) =>
      _$AppraisalQuestionFromJson(json);
}
