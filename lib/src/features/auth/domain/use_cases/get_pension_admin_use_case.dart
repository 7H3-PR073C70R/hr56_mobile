import 'package:hr56_staff/src/core/error/failure.dart';
import 'package:hr56_staff/src/core/utils/either.dart';
import 'package:hr56_staff/src/core/utils/use_case.dart';
import 'package:hr56_staff/src/features/auth/data/models/pension_admin/pension_admin.dart';
import 'package:hr56_staff/src/features/auth/domain/repositories/authentication_repository.dart';

class GetPensionAdminsUseCase with UseCase<List<PensionAdmin>, NoParams> {
  const GetPensionAdminsUseCase(this._repository);
  final AuthenticationRepository _repository;
  @override
  Future<Either<Failure, List<PensionAdmin>>> call(NoParams params) {
    return _repository.getPensionAdmins();
  }
}
