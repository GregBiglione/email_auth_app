import 'package:email_auth_app/domain/usecase/auth_usecase.dart';
import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  // Use case ------------------------------------------------------------------
  final AuthUseCase _authUseCase;

  HomeViewModel(this._authUseCase);

  // ---------------------------------------------------------------------------
  // Logout
  // ---------------------------------------------------------------------------

  logout() async {
    _authUseCase.logoutUseCase.launch();
  }
}