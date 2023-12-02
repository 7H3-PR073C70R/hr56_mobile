import 'package:hr56_staff/src/core/error/failure.dart';
import 'package:hr56_staff/src/core/utils/either.dart';
import 'package:hr56_staff/src/core/utils/use_case.dart';
import 'package:hr56_staff/src/features/wallet/data/models/look_up_account/look_up_account_model.dart';
import 'package:hr56_staff/src/features/wallet/data/models/look_up_account/look_up_account_param.dart';
import 'package:hr56_staff/src/features/wallet/domain/repositories/wallet_repository.dart';

class AccountLookupUseCase
    implements UseCase<LookupAccountModel?, LookupAccountParam> {
  const AccountLookupUseCase(this._repository);
  final WalletRepository _repository;
  @override
  Future<Either<Failure, LookupAccountModel?>> call(LookupAccountParam params) {
    return _repository.accountLookup(params);
  }
}
