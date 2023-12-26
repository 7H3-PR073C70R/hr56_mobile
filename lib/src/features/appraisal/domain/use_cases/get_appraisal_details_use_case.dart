import 'package:hr56_staff/src/core/error/failure.dart';
import 'package:hr56_staff/src/core/utils/either.dart';
import 'package:hr56_staff/src/core/utils/use_case.dart';
import 'package:hr56_staff/src/features/appraisal/data/models/appraisal_details/appraisal_details.dart';
import 'package:hr56_staff/src/features/appraisal/domain/repositories/appraisal_repository.dart';

class GetAppraisalDetailsUseCase implements UseCase<AppraisalDetails, String> {
  const GetAppraisalDetailsUseCase(this._repository);
  final AppraisalRepository _repository;

  @override
  Future<Either<Failure, AppraisalDetails>> call(String params) {
    return _repository.getAppraisalDetails(id: params);
  }
}
