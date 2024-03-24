import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_auth_app/app/app_preferences.dart';
import 'package:email_auth_app/app/constant.dart';
import 'package:email_auth_app/app/di/injection.dart';
import 'package:email_auth_app/domain/model/firestore_user.dart';
import 'package:email_auth_app/domain/model/user_data.dart';
import 'package:email_auth_app/domain/repository/auth/auth_repository.dart';
import 'package:email_auth_app/domain/utils/state_render.dart';
import 'package:email_auth_app/presentation/resource/string_manager.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

final AppPreferences _appPreferences = getIt<AppPreferences>();

class AuthRepositoryImplementer implements AuthRepository {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firestore;
  final CollectionReference _userReference;

  AuthRepositoryImplementer(this._firebaseAuth, this._firestore,
      @Named(USER_COLLECTION) this._userReference);

  @override
  Future<StateRender> register(UserData userData) async {
    try {
      UserCredential credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: userData.email,
        password: userData.password,
      );
      _appPreferences.setUserLogged();

      // Firestore -------------------------------------------------------------
      final DocumentSnapshot ds = await _firestore
          .collection(USER_COLLECTION)
          .doc(user?.uid)
          .get();

      if(!ds.exists) {
        FireStoreUser user = FireStoreUser(
          uid: credential.user!.uid,
          username: credential.user!.displayName ?? userData.username,
        );

        await _userReference.doc(user.uid).set(user.toJson());
      }

      return Success(credential);
    } on FirebaseAuthException catch (e) {
      return Error(e.message ?? StringManager.unknownError);
    }
  }

  @override
  Future<StateRender> login(String email, String password) async {
    try {
      UserCredential credential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      _appPreferences.setUserLogged();

      return Success(credential);
    } on FirebaseAuthException catch (e) {
      return Error(e.message ?? StringManager.unknownError);
    }
  }

  @override
  Future<StateRender> resetPassword(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(
        email: email,
      );

      return Success(StringManager.emailSentSuccessfully);
    } on FirebaseAuthException catch (e) {
      return Error(e.message ?? StringManager.unknownError);
    }
  }

  @override
  User? get user => _firebaseAuth.currentUser;

  @override
  Future<void> logout() async {
    _appPreferences.logout();
    await _firebaseAuth.signOut();
  }
}