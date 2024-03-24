import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_auth_app/app/constant.dart';
import 'package:email_auth_app/domain/model/firestore_user.dart';
import 'package:email_auth_app/domain/repository/user/user_repository.dart';
import 'package:email_auth_app/domain/utils/state_render.dart';
import 'package:injectable/injectable.dart';

import '../../../presentation/resource/string_manager.dart';

class UserRepositoryImplementer implements UserRepository {
  final CollectionReference _userReference;

  UserRepositoryImplementer(@Named(USER_COLLECTION) this._userReference);

  @override
  Stream<StateRender<FireStoreUser>> getUser(String uid) {
    try {
      final data = _userReference
          .doc(uid)
          .snapshots(includeMetadataChanges: true);

      final dataMap = data.map(
              (document) => Success(
                  FireStoreUser.fromJson(document.data() as Map<String, dynamic>),
              ),
      );

      return dataMap;
    }
    on FirebaseException catch (e) {
      throw Error(e.message ?? StringManager.unknownError);
    }
  }
}