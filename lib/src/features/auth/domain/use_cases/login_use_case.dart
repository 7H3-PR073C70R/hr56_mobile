import 'package:hr56_staff/src/core/error/failure.dart';
import 'package:hr56_staff/src/core/utils/either.dart';
import 'package:hr56_staff/src/core/utils/use_case.dart';
import 'package:hr56_staff/src/features/auth/data/models/login/login_param.dart';
import 'package:hr56_staff/src/features/auth/data/models/login/login_response.dart';
import 'package:hr56_staff/src/features/auth/domain/repositories/authentication_repository.dart';

class LoginUseCase with UseCase<LoginResponse, LoginParam> {
  const LoginUseCase(this._repository);
  final AuthenticationRepository _repository;
  @override
  Future<Either<Failure, LoginResponse>> call(LoginParam params) {
    return _repository.login(params);
  }
}
