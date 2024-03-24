import 'package:email_auth_app/domain/repository/auth/auth_repository.dart';

class ResetPasswordUseCase {
  final AuthRepository _repository;

  ResetPasswordUseCase(this._repository);

  launch(String email) => _repository.resetPassword(email);
}