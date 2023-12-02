import 'package:hr56_staff/src/core/error/failure.dart';
import 'package:hr56_staff/src/core/utils/either.dart';
import 'package:hr56_staff/src/core/utils/use_case.dart';
import 'package:hr56_staff/src/features/wallet/data/models/wallet_bank/wallet_bank.dart';
import 'package:hr56_staff/src/features/wallet/domain/repositories/wallet_repository.dart';

class GetWalletBanksUseCase implements UseCase<List<WalletBank>, NoParams> {
  const GetWalletBanksUseCase(this._repository);
  final WalletRepository _repository;
  @override
  Future<Either<Failure, List<WalletBank>>> call(NoParams params) {
    return _repository.getBanks();
  }
}
