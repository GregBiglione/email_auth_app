import '../model/user_data.dart';
import '../utils/state_render.dart';

abstract class AuthRepository {
  Future<StateRender> register(UserData userData);
  Future<StateRender> login(String email, String password);
  Future<StateRender> resetPassword(String email);
}