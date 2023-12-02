import 'package:hr56_staff/src/core/error/failure.dart';
import 'package:hr56_staff/src/core/utils/either.dart';
import 'package:hr56_staff/src/core/utils/use_case.dart';
import 'package:hr56_staff/src/features/wallet/data/models/validate_bill_payment_user/bill_payment_user_info.dart';
import 'package:hr56_staff/src/features/wallet/data/models/validate_bill_payment_user/validate_bill_payment_user_param.dart';
import 'package:hr56_staff/src/features/wallet/domain/repositories/wallet_repository.dart';

class ValidateBillPaymentUserUsecase
    implements UseCase<BillPaymentUserInfo?, ValidateBillPaymentUserParam> {
  const ValidateBillPaymentUserUsecase(this._repository);
  final WalletRepository _repository;
  @override
  Future<Either<Failure, BillPaymentUserInfo?>> call(
    ValidateBillPaymentUserParam params,
  ) {
    return _repository.validateBillPaymentUSer(params);
  }
}
