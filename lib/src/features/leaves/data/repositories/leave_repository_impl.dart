import 'package:hr56_staff/src/core/error/failure.dart';
import 'package:hr56_staff/src/core/extensions/extensions.dart';
import 'package:hr56_staff/src/core/utils/either.dart';
import 'package:hr56_staff/src/features/leaves/data/data_sources/leave_remote_data_source.dart';
import 'package:hr56_staff/src/features/leaves/data/models/create_leave_param/create_leave_param.dart';
import 'package:hr56_staff/src/features/leaves/data/models/leave_model/leave_model.dart';
import 'package:hr56_staff/src/features/leaves/data/models/leave_type/leave_type_model.dart';
import 'package:hr56_staff/src/features/leaves/domain/repositories/leave_repository.dart';

class LeaveRepositoryImpl implements LeaveRepository {
  const LeaveRepositoryImpl(this._dataSource);
  final LeaveRemoteDataSource _dataSource;

  @override
  Future<Either<Failure, void>> createLeave(CreateLeaveParam param) {
    return _dataSource.createLeave(param).makeRequest();
  }

  @override
  Future<Either<Failure, List<LeaveTypeModel>>> getLeaveTypes() {
    return _dataSource.getLeaveTypes().makeRequest();
  }

  @override
  Future<Either<Failure, List<LeaveModel>>> getLeaves() {
    return _dataSource.getLeaves().makeRequest();
  }

  @override
  Future<Either<Failure, void>> updateLeave({
    required String id,
    required CreateLeaveParam param,
  }) {
    return _dataSource.updateLeave(id: id, param: param).makeRequest();
  }
}
