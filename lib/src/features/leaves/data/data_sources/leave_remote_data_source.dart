import 'package:hr56_staff/src/features/leaves/data/client/leave_client.dart';
import 'package:hr56_staff/src/features/leaves/data/models/create_leave_param/create_leave_param.dart';
import 'package:hr56_staff/src/features/leaves/data/models/leave_model/leave_model.dart';
import 'package:hr56_staff/src/features/leaves/data/models/leave_type/leave_type_model.dart';

abstract class LeaveRemoteDataSource {
  Future<void> createLeave(
    CreateLeaveParam param,
  );

  Future<List<LeaveModel>> getLeaves();

  Future<void> updateLeave({
    required String id,
    required CreateLeaveParam param,
  });

  Future<List<LeaveTypeModel>> getLeaveTypes();
}

class LeaveRemoteDataSourceImpl implements LeaveRemoteDataSource {
  const LeaveRemoteDataSourceImpl(this._client);
  final LeaveClient _client;

  @override
  Future<void> createLeave(CreateLeaveParam param) {
    return _client.createLeave(param);
  }

  @override
  Future<List<LeaveTypeModel>> getLeaveTypes() {
    return _client.getLeaveTypes();
  }

  @override
  Future<List<LeaveModel>> getLeaves() {
    return _client.getLeaves();
  }

  @override
  Future<void> updateLeave({
    required String id,
    required CreateLeaveParam param,
  }) {
    return _client.updateLeave(id, param);
  }
}
