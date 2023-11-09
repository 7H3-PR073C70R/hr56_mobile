import 'package:equatable/equatable.dart';
import 'package:hr56_staff/src/core/error/failure.dart';
import 'package:hr56_staff/src/core/utils/either.dart';
import 'package:hr56_staff/src/core/utils/use_case.dart';
import 'package:hr56_staff/src/features/auth/data/models/personal_details/update_personal_details_param.dart';
import 'package:hr56_staff/src/features/auth/domain/repositories/authentication_repository.dart';

class UpdatePersonalInfoUseCase with UseCase<void, UpdatePersonalInfoParams> {
  const UpdatePersonalInfoUseCase(this._repository);
  final AuthenticationRepository _repository;
  @override
  Future<Either<Failure, void>> call(UpdatePersonalInfoParams params) {
    return _repository.updatePersonalInfo(
      id: params.id,
      param: params.param,
    );
  }
}

class UpdatePersonalInfoParams extends Equatable {
  const UpdatePersonalInfoParams({
    required this.id,
    required this.param,
  });
  final UpdatePersonalDetailsParam param;
  final String id;

  @override
  List<Object?> get props => [id, param];
}
