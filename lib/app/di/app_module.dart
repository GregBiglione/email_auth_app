import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_auth_app/data/repository/auth_repository_implementer.dart';
import 'package:email_auth_app/domain/repository/auth_repository.dart';
import 'package:email_auth_app/domain/usecase/auth_usecase.dart';
import 'package:email_auth_app/domain/usecase/login_usecase.dart';
import 'package:email_auth_app/domain/usecase/logout_usecase.dart';
import 'package:email_auth_app/domain/usecase/register_usecase.dart';
import 'package:email_auth_app/domain/usecase/reset_password_usecase.dart';
import 'package:email_auth_app/domain/usecase/user_session_usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../constant.dart';
import 'firebase_service.dart';

@module
abstract class AppModule {
  @preResolve
  Future<FirebaseService> get firebaseService => FirebaseService.init();

  @injectable
  FirebaseAuth get firebaseAuth => FirebaseAuth.instance;

  @injectable
  FirebaseFirestore get firebaseFirestore => FirebaseFirestore.instance;

  // Repository ----------------------------------------------------------------

  @injectable
  AuthRepository get authRepository => AuthRepositoryImplementer(
      firebaseAuth, usersCollection);

  // Collection ----------------------------------------------------------------

  @Named(USER)
  @injectable
  CollectionReference get usersCollection => firebaseFirestore.collection(USER);


  // Use case ------------------------------------------------------------------

  @injectable
  AuthUseCase get authUseCase => AuthUseCase(
    userSessionUseCase: UserSessionUseCase(authRepository),
    registerUseCase: RegisterUseCase(authRepository), 
    loginUseCase: LoginUseCase(authRepository), 
    resetPasswordUseCase: ResetPasswordUseCase(authRepository), 
    logoutUseCase: LogoutUseCase(authRepository), 
  );
}