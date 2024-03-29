part of 'appraisal_bloc.dart';

typedef QuestionAndAnswer = (String, String);

@freezed
class AppraisalState with _$AppraisalState {
  const factory AppraisalState.initial({
    @Default(ViewState.idle) ViewState viewState,
    @Default(ViewState.idle) ViewState getAppraisalDetailsState,
    @Default(ViewState.idle) ViewState getAppraisalQuestionnairesState,
    @Default([]) List<Appraisal> appraisal,
    AppraisalDetails? appraisalDetails,
    AppraisalQuestionnaire? appraisalQuestionnaire,
    @Default([]) List<QuestionAndAnswer> appraisalQuestionAndAnswer,
    String? errorMessage,
  }) = _Initial;
}
