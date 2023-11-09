import 'package:hr56_staff/src/core/error/failure.dart';
import 'package:hr56_staff/src/core/utils/either.dart';
import 'package:hr56_staff/src/core/utils/use_case.dart';
import 'package:hr56_staff/src/features/auth/data/models/bank/bank.dart';
import 'package:hr56_staff/src/features/auth/domain/repositories/authentication_repository.dart';

class GetBanksUseCase with UseCase<List<Bank>, NoParams> {
  const GetBanksUseCase(this._repository);
  final AuthenticationRepository _repository;
  @override
  Future<Either<Failure, List<Bank>>> call(NoParams params) {
    return _repository.getBanks();
  }
}
