import 'package:hr56_staff/src/core/error/failure.dart';
import 'package:hr56_staff/src/core/utils/either.dart';
import 'package:hr56_staff/src/core/utils/use_case.dart';
import 'package:hr56_staff/src/features/wallet/data/models/wallet/wallet.dart';
import 'package:hr56_staff/src/features/wallet/domain/repositories/wallet_repository.dart';

class GetWalletInfoUseCase implements UseCase<Wallet?, NoParams> {
  const GetWalletInfoUseCase(this._repository);
  final WalletRepository _repository;
  @override
  Future<Either<Failure, Wallet?>> call(NoParams params) {
    return _repository.getWalletInfo();
  }
}
