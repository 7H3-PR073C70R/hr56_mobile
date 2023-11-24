import 'package:hr56_staff/src/core/error/failure.dart';
import 'package:hr56_staff/src/core/utils/either.dart';
import 'package:hr56_staff/src/core/utils/use_case.dart';
import 'package:hr56_staff/src/features/wallet/data/models/send_money/send_money_param.dart';
import 'package:hr56_staff/src/features/wallet/domain/repositories/wallet_repository.dart';

class SendMoneyUseCase implements UseCase<void, SendMoneyParam> {
  const SendMoneyUseCase(this._repository);
  final WalletRepository _repository;
  @override
  Future<Either<Failure, void>> call(SendMoneyParam params) {
    return _repository.sendMoney(params);
  }
}
