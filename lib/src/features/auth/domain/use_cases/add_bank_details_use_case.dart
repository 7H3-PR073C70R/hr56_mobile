import 'package:hr56_staff/src/core/error/failure.dart';
import 'package:hr56_staff/src/core/utils/either.dart';
import 'package:hr56_staff/src/core/utils/use_case.dart';
import 'package:hr56_staff/src/features/auth/data/models/add_bank_details/add_bank_details_param.dart';
import 'package:hr56_staff/src/features/auth/domain/repositories/authentication_repository.dart';

class AddBankDetailsUseCase with UseCase<void, AddBankDetailsParam> {
  const AddBankDetailsUseCase(this._repository);
  final AuthenticationRepository _repository;
  @override
  Future<Either<Failure, void>> call(AddBankDetailsParam params) {
    return _repository.addBankDetails(params);
  }
}
