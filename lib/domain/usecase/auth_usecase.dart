import 'package:email_auth_app/domain/usecase/register_usecase.dart';

import 'login_usecase.dart';

class AuthUseCase {
  final RegisterUseCase registerUseCase;
  final LoginUseCase loginUseCase;

  AuthUseCase({required this.registerUseCase, required this.loginUseCase});
}