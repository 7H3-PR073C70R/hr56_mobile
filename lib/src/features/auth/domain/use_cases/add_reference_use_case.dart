import 'package:hr56_staff/src/core/error/failure.dart';
import 'package:hr56_staff/src/core/utils/either.dart';
import 'package:hr56_staff/src/core/utils/use_case.dart';
import 'package:hr56_staff/src/features/auth/data/models/add_reference/add_reference_param.dart';
import 'package:hr56_staff/src/features/auth/domain/repositories/authentication_repository.dart';

class AddReferenceUseCase with UseCase<void, AddReferenceParam> {
  const AddReferenceUseCase(this._repository);
  final AuthenticationRepository _repository;
  @override
  Future<Either<Failure, void>> call(AddReferenceParam params) {
    return _repository.addReference(params);
  }
}
