import 'package:email_auth_app/domain/usecase/register_usecase.dart';
import 'package:email_auth_app/domain/usecase/reset_password_usecase.dart';

import 'login_usecase.dart';

class AuthUseCase {
  final RegisterUseCase registerUseCase;
  final LoginUseCase loginUseCase;
  final ResetPasswordUseCase resetPasswordUseCase;

  AuthUseCase({required this.registerUseCase, required this.loginUseCase,
    required this.resetPasswordUseCase});
}