import 'dart:io';

import 'package:hr56_staff/src/core/error/failure.dart';
import 'package:hr56_staff/src/core/utils/either.dart';
import 'package:hr56_staff/src/core/utils/use_case.dart';
import 'package:hr56_staff/src/features/auth/data/models/add_guarantor/add_guarantor_param.dart';
import 'package:hr56_staff/src/features/auth/domain/repositories/authentication_repository.dart';

typedef AddGuarantorUseCaseParam =  (AddGuarantorParam, File);
class AddGuarantorUseCase with UseCase<void, AddGuarantorUseCaseParam> {
  const AddGuarantorUseCase(this._repository);
  final AuthenticationRepository _repository;
  @override
  Future<Either<Failure, void>> call(AddGuarantorUseCaseParam params) {
    return _repository.addGuarantor(params.$1, params.$2);
  }
}
