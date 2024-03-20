import 'package:email_auth_app/presentation/utils/validation_item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'reset_password_state.freezed.dart';
part 'reset_password_state.g.dart';

@freezed
class ResetPasswordState with _$ResetPasswordState {
  const ResetPasswordState._();

  const factory ResetPasswordState({
    @Default(ValidationItem()) ValidationItem email,
  }) = _ResetPasswordState;

  factory ResetPasswordState.fromJson(Map<String, dynamic> json) =>
      _$ResetPasswordStateFromJson(json);

  bool isValid() {
    if(email.value.isEmpty || email.error.isNotEmpty) {
      return false;
    }
    return true;
  }
}