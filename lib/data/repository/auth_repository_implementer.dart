import 'package:email_auth_app/domain/model/user_data.dart';
import 'package:email_auth_app/domain/repository/auth_repository.dart';
import 'package:email_auth_app/domain/utils/state_render.dart';
import 'package:email_auth_app/presentation/resource/string_manager.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepositoryImplementer implements AuthRepository {
  final FirebaseAuth _firebaseAuth;

  AuthRepositoryImplementer(this._firebaseAuth);

  @override
  Future<StateRender> register(UserData userData) async {
    try {
      UserCredential credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: userData.email,
        password: userData.password,
      );

      return Success(credential);
    } on FirebaseAuthException catch (e) {
      return Error(e.message ?? StringManager.unknownError);
    }
  }
}