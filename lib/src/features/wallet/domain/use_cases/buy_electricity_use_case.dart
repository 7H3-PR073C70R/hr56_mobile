import 'package:hr56_staff/src/core/error/failure.dart';
import 'package:hr56_staff/src/core/utils/either.dart';
import 'package:hr56_staff/src/core/utils/use_case.dart';
import 'package:hr56_staff/src/features/wallet/data/models/buy_electricity/buy_electricity_param.dart';
import 'package:hr56_staff/src/features/wallet/domain/repositories/wallet_repository.dart';

class BuyElectricityUseCase implements UseCase<void, BuyElectricityParam> {
  const BuyElectricityUseCase(this._repository);
  final WalletRepository _repository;
  @override
  Future<Either<Failure, void>> call(BuyElectricityParam params) {
    return _repository.buyElectricity(params);
  }
}
