import 'package:dio/dio.dart';
import 'package:hr56_staff/src/features/appraisal/data/models/appraisal/appraisal.dart';
import 'package:hr56_staff/src/features/appraisal/data/models/appraisal_details/appraisal_details.dart';
import 'package:hr56_staff/src/features/appraisal/data/models/appraisal_questionnaire/appraisal_questionnaire.dart';
import 'package:retrofit/retrofit.dart';

part 'appraisal_client.g.dart';

@RestApi()
abstract class AppraisalClient {
  factory AppraisalClient(Dio dio, {String baseUrl}) = _AppraisalClient;

  @POST('take-employee-appraisals/{id}')
  Future<void> submitAppraisal(
    @Body() Map<String, dynamic> param,
    @Path('id') String id,
  );

  @GET('employee-appraisals')
  Future<List<Appraisal>> getAppraisal();

  @GET('employee-appraisals/{id}')
  Future<AppraisalDetails> getAppraisalDetails(
    @Path('id') String id,
  );

  @GET('take-employee-appraisals/{id}')
  Future<AppraisalQuestionnaire> takeAppraisal(
    @Path('id') String id,
  );
}
