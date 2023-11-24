import 'package:hr56_staff/src/core/error/failure.dart';
import 'package:hr56_staff/src/core/utils/either.dart';
import 'package:hr56_staff/src/core/utils/use_case.dart';
import 'package:hr56_staff/src/features/wallet/data/models/purchase_airtime/purchase_airtime_param.dart';
import 'package:hr56_staff/src/features/wallet/domain/repositories/wallet_repository.dart';

class PurchaseAirtimeUseCase implements UseCase<dynamic, PurchaseAirtimeParam> {
  const PurchaseAirtimeUseCase(this._repository);
  final WalletRepository _repository;
  @override
  Future<Either<Failure, dynamic>> call(PurchaseAirtimeParam params) {
    return _repository.purchaseAirtime(params);
  }
}
