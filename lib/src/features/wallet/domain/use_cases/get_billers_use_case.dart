import 'package:hr56_staff/src/core/error/failure.dart';
import 'package:hr56_staff/src/core/utils/either.dart';
import 'package:hr56_staff/src/core/utils/use_case.dart';
import 'package:hr56_staff/src/features/wallet/data/models/biller/biller.dart';
import 'package:hr56_staff/src/features/wallet/domain/repositories/wallet_repository.dart';

class GetBillersUseCase implements UseCase<List<Biller>, String> {
  const GetBillersUseCase(this._repository);
  final WalletRepository _repository;
  @override
  Future<Either<Failure, List<Biller>>> call(String params) {
    return _repository.getBillers(params);
  }
}
