import 'dart:async';

import 'package:email_auth_app/domain/usecase/auth/auth_usecase.dart';
import 'package:email_auth_app/presentation/resource/string_manager.dart';
import 'package:email_auth_app/presentation/screen/auth/register/register_state.dart';
import 'package:email_auth_app/presentation/utils/validation_item.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../app/function.dart';
import '../../../../domain/utils/state_render.dart';

class RegisterViewModel extends ChangeNotifier {
  // State ---------------------------------------------------------------------
  RegisterState _state = const RegisterState();
  // Use case ------------------------------------------------------------------
  final AuthUseCase _authUseCase;
  final StreamController<StateRender> _responseController = BehaviorSubject();
  String password = "";
  List<FocusNode> focusNodeList = [
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
  ];
  bool isObscuredText = true;
  bool isObscuredConfirmedText = true;
  bool is8Characters = false;
  bool isUppercase = false;
  bool isLowercase = false;
  bool isNumber = false;
  bool isSpecialCharacter = false;
  double percentage = 0.0;
  bool isErrorDisplayed = false;

  RegisterViewModel(this._authUseCase);

  // Getters -------------------------------------------------------------------
  RegisterState get state => _state;
  Stream<StateRender> get response => _responseController.stream;

  // Setters -------------------------------------------------------------------
  void setUsername(String value) {
    _responseController.add(Init());

    if(value.length >= 3) {
      _state = _state.copyWith(
        username: ValidationItem(
          value: value,
          error: "",
        ),
      );
    }
    else {
      _state = _state.copyWith(
        username: const ValidationItem(
          error: StringManager.usernameError,
        ),
      );
    }
    notifyListeners();
  }

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
    password = value;

    if(isPasswordEnoughStrength(value)) {
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
          error: StringManager.passwordError,
        ),
      );
    }
    notifyListeners();
  }

  void setConfirmPassword(String value) {
    _responseController.add(Init());

    if(value.compareTo(password) == 0) {
      _state = _state.copyWith(
        confirmPassword: ValidationItem(
          value: value,
          error: "",
        ),
      );
    }
    else {
      _state = _state.copyWith(
        confirmPassword: const ValidationItem(
          error: StringManager.confirmPasswordError,
        ),
      );
    }
    notifyListeners();
  }

  // ---------------------------------------------------------------------------
  // Register
  // ---------------------------------------------------------------------------

  void register() async {
    if(state.isValid()) {
      // Loading ---------------------------------------------------------------
      _responseController.add(Loading());

      // Register --------------------------------------------------------------
      final data = await _authUseCase.registerUseCase.launch(_state.toUserData());
      _responseController.add(data);
    }
  }
}