import 'package:email_auth_app/presentation/utils/validation_item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.freezed.dart';
part 'login_state.g.dart';

@freezed
class LoginState with _$LoginState {
  const LoginState._();

  const factory LoginState({
    @Default(ValidationItem()) ValidationItem email,
    @Default(ValidationItem()) ValidationItem password,
  }) = _LoginState;

  factory LoginState.fromJson(Map<String, dynamic> json) =>
      _$LoginStateFromJson(json);

  bool isValid() {
    if(email.value.isEmpty || email.error.isNotEmpty
        || password.value.isEmpty || password.error.isNotEmpty) {
      return false;
    }
    return true;
  }
}