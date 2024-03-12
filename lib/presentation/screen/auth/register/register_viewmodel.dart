import 'dart:async';

import 'package:email_auth_app/domain/usecase/auth_usecase.dart';
import 'package:email_auth_app/presentation/resource/string_manager.dart';
import 'package:email_auth_app/presentation/screen/auth/register/register_state.dart';
import 'package:email_auth_app/presentation/utils/validation_item.dart';
import 'package:flutter/material.dart';

import '../../../../domain/utils/state_render.dart';

class RegisterViewModel extends ChangeNotifier {
  // State ---------------------------------------------------------------------
  RegisterState _state = const RegisterState();
  // Use case ------------------------------------------------------------------
  final AuthUseCase _authUseCase;
  final StreamController<StateRender> _responseController = StreamController();

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
}