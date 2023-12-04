import 'package:hr56_staff/src/core/error/failure.dart';
import 'package:hr56_staff/src/core/utils/either.dart';
import 'package:hr56_staff/src/core/utils/use_case.dart';
import 'package:hr56_staff/src/features/wallet/data/models/create_transaction_pin/create_transaction_pin_param.dart';
import 'package:hr56_staff/src/features/wallet/domain/repositories/wallet_repository.dart';

class CreateTransactionPINUseCase
    implements UseCase<void, CreateTransactionPinParam> {
  const CreateTransactionPINUseCase(this._repository);
  final WalletRepository _repository;
  @override
  Future<Either<Failure, dynamic>> call(CreateTransactionPinParam params) {
    return _repository.createTransactionPIN(params);
  }
}
