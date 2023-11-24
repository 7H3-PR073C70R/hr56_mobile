import 'package:hr56_staff/src/core/error/failure.dart';
import 'package:hr56_staff/src/core/utils/either.dart';
import 'package:hr56_staff/src/core/utils/use_case.dart';
import 'package:hr56_staff/src/features/wallet/domain/repositories/wallet_repository.dart';

class GetCablePlansUseCase implements UseCase<dynamic, String> {
  const GetCablePlansUseCase(this._repository);
  final WalletRepository _repository;
  @override
  Future<Either<Failure, dynamic>> call(String params) {
    return _repository.getCablePlans(params);
  }
}
