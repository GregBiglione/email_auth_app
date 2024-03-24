import 'package:email_auth_app/domain/model/user_data.dart';
import 'package:email_auth_app/domain/repository/auth/auth_repository.dart';

class RegisterUseCase {
  final AuthRepository _repository;

  RegisterUseCase(this._repository);

  launch(UserData userData) => _repository.register(userData);
}