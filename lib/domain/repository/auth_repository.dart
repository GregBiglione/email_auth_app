import '../model/user_data.dart';
import '../utils/state_render.dart';

abstract class AuthRepository {
  Future<StateRender> register(UserData userData);
}