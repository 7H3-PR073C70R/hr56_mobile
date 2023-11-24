import 'package:hr56_staff/src/core/error/failure.dart';
import 'package:hr56_staff/src/core/utils/either.dart';
import 'package:hr56_staff/src/features/leaves/data/models/create_leave_param/create_leave_param.dart';
import 'package:hr56_staff/src/features/leaves/data/models/leave_model/leave_model.dart';
import 'package:hr56_staff/src/features/leaves/data/models/leave_type/leave_type_model.dart';

abstract class LeaveRepository {
  Future<Either<Failure, void>> createLeave(
    CreateLeaveParam param,
  );

  Future<Either<Failure, List<LeaveModel>>> getLeaves();

  Future<Either<Failure, void>> updateLeave({
    required String id,
    required CreateLeaveParam param,
  });

  Future<Either<Failure, List<LeaveTypeModel>>> getLeaveTypes();
}
