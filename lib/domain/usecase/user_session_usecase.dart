import 'package:email_auth_app/domain/repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserSessionUseCase {
  final AuthRepository _repository;

  UserSessionUseCase(this._repository);

  User? get userSession => _repository.user;
}