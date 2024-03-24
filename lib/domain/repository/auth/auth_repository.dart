import 'package:firebase_auth/firebase_auth.dart';

import '../../model/user_data.dart';
import '../../utils/state_render.dart';

abstract class AuthRepository {
  User? get user;
  Future<StateRender> register(UserData userData);
  Future<StateRender> login(String email, String password);
  Future<StateRender> resetPassword(String email);
  Future<void> logout();
}