import 'package:hr56_staff/src/core/error/failure.dart';
import 'package:hr56_staff/src/core/utils/either.dart';
import 'package:hr56_staff/src/core/utils/use_case.dart';
import 'package:hr56_staff/src/features/auth/data/models/add_emergency_contact/add_emergency_contact_param.dart';
import 'package:hr56_staff/src/features/auth/domain/repositories/authentication_repository.dart';

class AddEmergencyContactUseCase with UseCase<void, AddEmergencyContactParam> {
  const AddEmergencyContactUseCase(this._repository);
  final AuthenticationRepository _repository;
  @override
  Future<Either<Failure, void>> call(AddEmergencyContactParam params) {
    return _repository.addEmergencyContact(params);
  }
}
