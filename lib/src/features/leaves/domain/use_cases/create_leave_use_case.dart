import 'package:hr56_staff/src/core/error/failure.dart';
import 'package:hr56_staff/src/core/utils/either.dart';
import 'package:hr56_staff/src/core/utils/use_case.dart';
import 'package:hr56_staff/src/features/leaves/data/models/create_leave_param/create_leave_param.dart';
import 'package:hr56_staff/src/features/leaves/domain/repositories/leave_repository.dart';

class CreateLeaveUseCase implements UseCase<void, CreateLeaveParam> {
  const CreateLeaveUseCase(this._repository);
  final LeaveRepository _repository;
  @override
  Future<Either<Failure, void>> call(CreateLeaveParam params) {
    return _repository.createLeave(params);
  }
}
