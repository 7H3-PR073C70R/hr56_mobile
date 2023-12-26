import 'package:hr56_staff/src/core/error/failure.dart';
import 'package:hr56_staff/src/core/utils/either.dart';
import 'package:hr56_staff/src/features/appraisal/data/models/appraisal/appraisal.dart';
import 'package:hr56_staff/src/features/appraisal/data/models/appraisal_details/appraisal_details.dart';
import 'package:hr56_staff/src/features/appraisal/data/models/appraisal_questionnaire/appraisal_questionnaire.dart';

abstract class AppraisalRepository {
  Future<Either<Failure, void>> submitAppraisal({
    required Map<String, dynamic> param,
    required String id,
  });

  Future<Either<Failure, List<Appraisal>>> getAppraisal();

  Future<Either<Failure, AppraisalDetails>> getAppraisalDetails({
    required String id,
  });

  Future<Either<Failure, AppraisalQuestionnaire>> takeAppraisal({
    required String id,
  });
}
