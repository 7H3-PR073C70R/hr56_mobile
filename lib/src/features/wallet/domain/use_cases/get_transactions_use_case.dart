import 'package:hr56_staff/src/core/error/failure.dart';
import 'package:hr56_staff/src/core/utils/either.dart';
import 'package:hr56_staff/src/core/utils/use_case.dart';
import 'package:hr56_staff/src/features/wallet/data/models/transaction/transaction.dart';
import 'package:hr56_staff/src/features/wallet/domain/repositories/wallet_repository.dart';

class GetTransactionsUseCase implements UseCase<List<Transaction>, NoParams> {
  const GetTransactionsUseCase(this._repository);
  final WalletRepository _repository;
  @override
  Future<Either<Failure, List<Transaction>>> call(NoParams params) {
    return _repository.getTransaction();
  }
}
