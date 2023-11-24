import 'package:hr56_staff/src/core/error/failure.dart';
import 'package:hr56_staff/src/core/utils/either.dart';
import 'package:hr56_staff/src/core/utils/use_case.dart';
import 'package:hr56_staff/src/features/leaves/data/models/leave_model/leave_model.dart';
import 'package:hr56_staff/src/features/leaves/domain/repositories/leave_repository.dart';

class GetLeaveUseCase implements UseCase<List<LeaveModel>, NoParams> {
  const GetLeaveUseCase(this._repository);
  final LeaveRepository _repository;
  @override
  Future<Either<Failure, List<LeaveModel>>> call(NoParams params) {
    return _repository.getLeaves();
  }
}
