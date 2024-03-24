import 'package:email_auth_app/domain/model/firestore_user.dart';

import '../../utils/state_render.dart';

abstract class UserRepository {
  Stream<StateRender<FireStoreUser>> getUser(String uid);
}