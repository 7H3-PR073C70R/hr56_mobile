import 'package:hr56_staff/src/core/error/failure.dart';
import 'package:hr56_staff/src/core/extensions/extensions.dart';
import 'package:hr56_staff/src/core/utils/either.dart';
import 'package:hr56_staff/src/features/appraisal/data/data_sources/appraisal_data_source.dart';
import 'package:hr56_staff/src/features/appraisal/data/models/appraisal/appraisal.dart';
import 'package:hr56_staff/src/features/appraisal/data/models/appraisal_details/appraisal_details.dart';
import 'package:hr56_staff/src/features/appraisal/data/models/appraisal_questionnaire/appraisal_questionnaire.dart';
import 'package:hr56_staff/src/features/appraisal/domain/repositories/appraisal_repository.dart';

class AppraisalRepositoryImpl implements AppraisalRepository {
  const AppraisalRepositoryImpl(this._dataSource);
  final AppraisalRemoteDataSource _dataSource;
  @override
  Future<Either<Failure, List<Appraisal>>> getAppraisal() {
    return _dataSource.getAppraisal().makeRequest();
  }

  @override
  Future<Either<Failure, AppraisalDetails>> getAppraisalDetails({
    required String id,
  }) {
    return _dataSource.getAppraisalDetails(id: id).makeRequest();
  }

  @override
  Future<Either<Failure, void>> submitAppraisal({
    required Map<String, dynamic> param,
    required String id,
  }) {
    return _dataSource.submitAppraisal(param: param, id: id).makeRequest();
  }

  @override
  Future<Either<Failure, AppraisalQuestionnaire>> takeAppraisal({
    required String id,
  }) {
    return _dataSource.takeAppraisal(id: id).makeRequest();
  }
}
