import 'package:dio/dio.dart';
import 'package:hr56_staff/src/features/leaves/data/models/create_leave_param/create_leave_param.dart';
import 'package:hr56_staff/src/features/leaves/data/models/leave_model/leave_model.dart';
import 'package:hr56_staff/src/features/leaves/data/models/leave_type/leave_type_model.dart';
import 'package:retrofit/retrofit.dart';

part 'leave_client.g.dart';

@RestApi()
abstract class LeaveClient {
  factory LeaveClient(Dio dio, {String baseUrl}) = _LeaveClient;

  @POST('leaves')
  Future<void> createLeave(
    @Body() CreateLeaveParam param,
  );

  @GET('leaves')
  Future<List<LeaveModel>> getLeaves();

  @PUT('leaves/{id}')
  Future<void> updateLeave(
    @Path('id') String id,
    @Body() CreateLeaveParam param,
  );

  @GET('leave-types')
  Future<List<LeaveTypeModel>> getLeaveTypes();
}
