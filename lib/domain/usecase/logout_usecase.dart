import 'package:email_auth_app/domain/repository/auth_repository.dart';

class LogoutUseCase {
  final AuthRepository _repository;

  LogoutUseCase(this._repository);

  launch() => _repository.logout();
}