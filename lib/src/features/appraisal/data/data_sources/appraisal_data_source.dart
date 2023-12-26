import 'package:hr56_staff/src/features/appraisal/data/client/appraisal_client.dart';
import 'package:hr56_staff/src/features/appraisal/data/models/appraisal/appraisal.dart';
import 'package:hr56_staff/src/features/appraisal/data/models/appraisal_details/appraisal_details.dart';
import 'package:hr56_staff/src/features/appraisal/data/models/appraisal_questionnaire/appraisal_questionnaire.dart';

abstract class AppraisalRemoteDataSource {
  Future<void> submitAppraisal({
    required Map<String, dynamic> param,
    required String id,
  });

  Future<List<Appraisal>> getAppraisal();

  Future<AppraisalDetails> getAppraisalDetails({
    required String id,
  });

  Future<AppraisalQuestionnaire> takeAppraisal({
    required String id,
  });
}

class AppraisalRemoteDataSourceImpl implements AppraisalRemoteDataSource {
  const AppraisalRemoteDataSourceImpl(this._appraisalClient);

  final AppraisalClient _appraisalClient;

  @override
  Future<List<Appraisal>> getAppraisal() {
    return _appraisalClient.getAppraisal();
  }

  @override
  Future<AppraisalDetails> getAppraisalDetails({
    required String id,
  }) {
    return _appraisalClient.getAppraisalDetails(id);
  }

  @override
  Future<void> submitAppraisal({
    required Map<String, dynamic> param,
    required String id,
  }) {
    return _appraisalClient.submitAppraisal(param, id);
  }

  @override
  Future<AppraisalQuestionnaire> takeAppraisal({
    required String id,
  }) {
    return _appraisalClient.takeAppraisal(id);
  }
}
