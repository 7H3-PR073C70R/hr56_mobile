import 'package:hr56_staff/src/core/error/failure.dart';
import 'package:hr56_staff/src/core/utils/either.dart';
import 'package:hr56_staff/src/core/utils/use_case.dart';
import 'package:hr56_staff/src/features/leaves/data/models/leave_type/leave_type_model.dart';
import 'package:hr56_staff/src/features/leaves/domain/repositories/leave_repository.dart';

class GetLeaveTypeUseCase implements UseCase<List<LeaveTypeModel>, NoParams> {
  const GetLeaveTypeUseCase(this._repository);
  final LeaveRepository _repository;
  @override
  Future<Either<Failure, List<LeaveTypeModel>>> call(NoParams params) {
    return _repository.getLeaveTypes();
  }
}
