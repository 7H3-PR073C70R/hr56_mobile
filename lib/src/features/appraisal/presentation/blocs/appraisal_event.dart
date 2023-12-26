part of 'appraisal_bloc.dart';

@freezed
class AppraisalEvent with _$AppraisalEvent {
  const factory AppraisalEvent.started() = _Started;
  const factory AppraisalEvent.getAppraisal() = _GetAppraisal;
  const factory AppraisalEvent.getAppraisalDetails(String id) =
      _GetAppraisalDetails;
  const factory AppraisalEvent.getAppraisalQuestionnaire(String id) =
      _GetAppraisalQuestionnaire;
  const factory AppraisalEvent.updateAppraisalQuestionAndAnswer(
    QuestionAndAnswer questionAndAnswer,
  ) = _UpdateAppraisalQuestionAndAnswer;
}
