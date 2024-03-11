import 'package:email_auth_app/data/repository/auth_repository_implementer.dart';
import 'package:email_auth_app/domain/repository/auth_repository.dart';
import 'package:email_auth_app/domain/usecase/auth_usecase.dart';
import 'package:email_auth_app/domain/usecase/register_usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'firebase_service.dart';

@module
abstract class AppModule {
  @preResolve
  Future<FirebaseService> get firebaseService => FirebaseService.init();

  @injectable
  FirebaseAuth get firebaseAuth => FirebaseAuth.instance;

  // Repository ----------------------------------------------------------------

  @injectable
  AuthRepository get authRepository => AuthRepositoryImplementer(firebaseAuth);

  // Use case ------------------------------------------------------------------

  @injectable
  AuthUseCase get authUseCase => AuthUseCase(
    registerUseCase: RegisterUseCase(authRepository),
  );
}