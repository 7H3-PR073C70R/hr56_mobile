import 'package:hr56_staff/src/core/error/failure.dart';
import 'package:hr56_staff/src/core/utils/either.dart';
import 'package:hr56_staff/src/core/utils/use_case.dart';
import 'package:hr56_staff/src/features/appraisal/data/models/appraisal_questionnaire/appraisal_questionnaire.dart';
import 'package:hr56_staff/src/features/appraisal/domain/repositories/appraisal_repository.dart';

class TakeAppraisalUseCase implements UseCase<AppraisalQuestionnaire, String> {
  const TakeAppraisalUseCase(this._repository);
  final AppraisalRepository _repository;
  @override
  Future<Either<Failure, AppraisalQuestionnaire>> call(String params) {
    return _repository.takeAppraisal(id: params);
  }
}
