import 'package:hr56_staff/src/core/error/failure.dart';
import 'package:hr56_staff/src/core/utils/either.dart';
import 'package:hr56_staff/src/core/utils/use_case.dart';
import 'package:hr56_staff/src/features/appraisal/data/models/appraisal/appraisal.dart';
import 'package:hr56_staff/src/features/appraisal/domain/repositories/appraisal_repository.dart';

class GetAppraisalUseCase implements UseCase<List<Appraisal>, NoParams> {
  const GetAppraisalUseCase(this._repository);
  final AppraisalRepository _repository;
  @override
  Future<Either<Failure, List<Appraisal>>> call(NoParams params) {
    return _repository.getAppraisal();
  }
}
