import 'package:hr56_staff/src/core/error/failure.dart';
import 'package:hr56_staff/src/core/utils/either.dart';
import 'package:hr56_staff/src/core/utils/use_case.dart';
import 'package:hr56_staff/src/features/auth/data/models/state_response/state_response.dart';
import 'package:hr56_staff/src/features/auth/domain/repositories/authentication_repository.dart';

class GetStateUseCase with UseCase<List<StateResponse>, NoParams> {
  const GetStateUseCase(this._repository);
  final AuthenticationRepository _repository;
  @override
  Future<Either<Failure, List<StateResponse>>> call(NoParams params) {
    return _repository.getStates();
  }
}
