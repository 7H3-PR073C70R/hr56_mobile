import 'package:hr56_staff/src/core/error/failure.dart';
import 'package:hr56_staff/src/core/utils/either.dart';
import 'package:hr56_staff/src/core/utils/use_case.dart';
import 'package:hr56_staff/src/features/auth/data/models/hospital/hospital.dart';
import 'package:hr56_staff/src/features/auth/domain/repositories/authentication_repository.dart';

class GetHospitalUseCase with UseCase<List<Hospital>, NoParams> {
  const GetHospitalUseCase(this._repository);
  final AuthenticationRepository _repository;
  @override
  Future<Either<Failure, List<Hospital>>> call(NoParams params) {
    return _repository.getHospitals();
  }
}
