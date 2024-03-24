import 'package:email_auth_app/domain/repository/auth/auth_repository.dart';

class LoginUseCase {
  final AuthRepository _repository;

  LoginUseCase(this._repository);

  launch({required String email, required String password}) => _repository
      .login(email, password);
}