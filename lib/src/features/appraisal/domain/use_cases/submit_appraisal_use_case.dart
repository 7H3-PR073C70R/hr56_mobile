import 'package:equatable/equatable.dart';
import 'package:hr56_staff/src/core/error/failure.dart';
import 'package:hr56_staff/src/core/utils/either.dart';
import 'package:hr56_staff/src/core/utils/use_case.dart';
import 'package:hr56_staff/src/features/appraisal/domain/repositories/appraisal_repository.dart';

class SubmitAppraisalUseCase
    implements UseCase<void, SubmitAppraisalUseCaseParam> {
  const SubmitAppraisalUseCase(this._repository);
  final AppraisalRepository _repository;
  @override
  Future<Either<Failure, void>> call(SubmitAppraisalUseCaseParam params) {
    return _repository.submitAppraisal(param: params.param, id: params.id);
  }
}

class SubmitAppraisalUseCaseParam extends Equatable {
  const SubmitAppraisalUseCaseParam({
    required this.param,
    required this.id,
  });
  final Map<String, dynamic> param;
  final String id;

  @override
  List<Object?> get props => [
        param,
        id,
      ];
}
