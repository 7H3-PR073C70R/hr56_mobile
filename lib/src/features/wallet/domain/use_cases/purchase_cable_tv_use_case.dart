import 'package:hr56_staff/src/core/error/failure.dart';
import 'package:hr56_staff/src/core/utils/either.dart';
import 'package:hr56_staff/src/core/utils/use_case.dart';
import 'package:hr56_staff/src/features/wallet/data/models/purchase_cable_tv/purchase_cable_tv_param.dart';
import 'package:hr56_staff/src/features/wallet/domain/repositories/wallet_repository.dart';

class PurchaseCableTVUseCase
    implements UseCase<dynamic, PurchaseCableTvParam> {
  const PurchaseCableTVUseCase(this._repository);
  final WalletRepository _repository;
  @override
  Future<Either<Failure, dynamic>> call(PurchaseCableTvParam params) {
    return _repository.purchaseCableTV(params);
  }
}
