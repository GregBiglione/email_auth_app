import 'package:email_auth_app/domain/model/user_data.dart';
import 'package:email_auth_app/presentation/utils/validation_item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_state.freezed.dart';
part 'register_state.g.dart';

@freezed
class RegisterState with _$RegisterState {
  const RegisterState._();

  const factory RegisterState({
    @Default(ValidationItem()) ValidationItem username,
    @Default(ValidationItem()) ValidationItem email,
    @Default(ValidationItem()) ValidationItem password,
    @Default(ValidationItem()) ValidationItem confirmPassword,
  }) = _RegisterState;

  factory RegisterState.fromJson(Map<String, dynamic> json) =>
      _$RegisterStateFromJson(json);

  toUserData() => UserData(
    username: username.value,
    email:  email.value,
    password: password.value,
  );

  bool isValid() {
    if(username.value.isNotEmpty || username.error.isNotEmpty
        || email.value.isNotEmpty || email.error.isNotEmpty
        || password.value.isNotEmpty || password.error.isNotEmpty
        || confirmPassword.value.isNotEmpty || confirmPassword.error.isNotEmpty
        || password.value != confirmPassword.value) {
      return false;
    }
    return true;
  }
}