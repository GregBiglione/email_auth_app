import 'dart:async';

import 'package:email_auth_app/presentation/screen/auth/login/login_state.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../app/function.dart';
import '../../../../domain/usecase/auth_usecase.dart';
import '../../../../domain/utils/state_render.dart';
import '../../../resource/string_manager.dart';
import '../../../utils/validation_item.dart';

class LoginViewModel extends ChangeNotifier {
  // State ---------------------------------------------------------------------
  LoginState _state = const LoginState();
  // Use case ------------------------------------------------------------------
  final AuthUseCase _authUseCase;
  final StreamController<StateRender> _responseController = BehaviorSubject();
  List<FocusNode> focusNodeList = [
    FocusNode(),
    FocusNode(),
  ];
  bool isObscuredText = true;
  bool isErrorDisplayed = false;

  LoginViewModel(this._authUseCase);

  // Getters -------------------------------------------------------------------
  LoginState get state => _state;
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

  void setPassword(String value) {
    _responseController.add(Init());

    if(value.isNotEmpty) {
      _state = _state.copyWith(
        password: ValidationItem(
          value: value,
          error: "",
        ),
      );
    }
    else {
      _state = _state.copyWith(
        password: const ValidationItem(
          error: StringManager.emptyPasswordError,
        ),
      );
    }
    notifyListeners();
  }

  // ---------------------------------------------------------------------------
  // Login
  // ---------------------------------------------------------------------------

  void login() async {
    if(state.isValid()) {
      // Loading ---------------------------------------------------------------
      _responseController.add(Loading());

      // Login -----------------------------------------------------------------
      final data = await _authUseCase.loginUseCase.launch(
        email: _state.email.value,
        password: _state.password.value,
      );
      _responseController.add(data);

      // Clear fields ----------------------------------------------------------
      clearEmailField();
      clearPasswordField();
    }
  }

  // ---------------------------------------------------------------------------
  // Clear text field
  // ---------------------------------------------------------------------------

  void clearEmailField() {
    _state = _state.copyWith(
      email: const ValidationItem(
        value: "",
      ),
    );
  }

  void clearPasswordField() {
    _state = _state.copyWith(
      password: const ValidationItem(
        value: "",
      ),
    );
  }
}