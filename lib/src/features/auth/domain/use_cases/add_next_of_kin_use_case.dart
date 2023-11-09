import 'package:hr56_staff/src/core/error/failure.dart';
import 'package:hr56_staff/src/core/utils/either.dart';
import 'package:hr56_staff/src/core/utils/use_case.dart';
import 'package:hr56_staff/src/features/auth/data/models/next_of_kin/next_of_kin_param.dart';
import 'package:hr56_staff/src/features/auth/domain/repositories/authentication_repository.dart';

class AddNextOfKinUseCase with UseCase<void, NextOfKinParam> {
  const AddNextOfKinUseCase(this._repository);
  final AuthenticationRepository _repository;
  @override
  Future<Either<Failure, void>> call(NextOfKinParam params) {
    return _repository.addNextOfKin(params);
  }
}
