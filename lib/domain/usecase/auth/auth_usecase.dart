import 'package:email_auth_app/domain/usecase/auth/register_usecase.dart';
import 'package:email_auth_app/domain/usecase/auth/reset_password_usecase.dart';
import 'package:email_auth_app/domain/usecase/auth/user_session_usecase.dart';

import 'login_usecase.dart';
import 'logout_usecase.dart';

class AuthUseCase {
  final UserSessionUseCase userSessionUseCase;
  final RegisterUseCase registerUseCase;
  final LoginUseCase loginUseCase;
  final ResetPasswordUseCase resetPasswordUseCase;
  final LogoutUseCase logoutUseCase;

  AuthUseCase({required this.userSessionUseCase, required this.registerUseCase,
    required this.loginUseCase, required this.resetPasswordUseCase,
    required this.logoutUseCase});
}