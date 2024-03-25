import 'dart:async';

import 'package:email_auth_app/presentation/screen/auth/forgot_password/reset_password_state.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../app/function.dart';
import '../../../../domain/usecase/auth/auth_usecase.dart';
import '../../../../domain/utils/state_render.dart';
import '../../../resource/string_manager.dart';
import '../../../utils/validation_item.dart';

class ForgotPasswordViewModel extends ChangeNotifier {
  // State ---------------------------------------------------------------------
  ResetPasswordState _state = const ResetPasswordState();
  // Use case ------------------------------------------------------------------
  final AuthUseCase _authUseCase;
  final StreamController<StateRender> _responseController = BehaviorSubject();
  FocusNode focusNode = FocusNode();
  bool isErrorDisplayed = false;

  ForgotPasswordViewModel(this._authUseCase);

  // Getters -------------------------------------------------------------------
  ResetPasswordState get state => _state;
  Stream<StateRender> get response => _responseController.stream;

  // Setters -------------------------------------------------------------------
  void setEmail(String value) {
    _responseController.add(Init());

    if(isEmailValid(value)) {
      _state = _state.copyWith(
        email: ValidationItem(
          value: value,
          error: "",
        ),
      );
    }
    else {
      _state = _state.copyWith(
        email: const ValidationItem(
          error: StringManager.emailError,
        ),
      );
    }
    notifyListeners();
  }

  // ---------------------------------------------------------------------------
  // Reset password
  // ---------------------------------------------------------------------------

  void resetPassword() async {
    if(state.isValid()) {
      // Loading ---------------------------------------------------------------
      _responseController.add(Loading());

      // Login -----------------------------------------------------------------
      final data = await _authUseCase.resetPasswordUseCase
          .launch(_state.email.value);
      _responseController.add(data);
    }
  }
}