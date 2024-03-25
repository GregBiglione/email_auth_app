import 'package:email_auth_app/domain/model/firestore_user.dart';
import 'package:email_auth_app/domain/usecase/auth/auth_usecase.dart';
import 'package:email_auth_app/domain/utils/state_render.dart';
import 'package:flutter/material.dart';

import '../../../domain/usecase/user/user_usecase.dart';

class HomeViewModel extends ChangeNotifier {
  // Use case ------------------------------------------------------------------
  final AuthUseCase _authUseCase;
  final UserUseCase _userUseCase;

  HomeViewModel(this._authUseCase, this._userUseCase);

  // ---------------------------------------------------------------------------
  // Get user
  // ---------------------------------------------------------------------------

  Stream<StateRender<FireStoreUser>> getUser() {
    String uid = _authUseCase.userSessionUseCase.userSession!.uid;

    return _userUseCase.getUserUseCase.launch(uid);
  }

  // ---------------------------------------------------------------------------
  // Logout
  // ---------------------------------------------------------------------------

  logout() async {
    _authUseCase.logoutUseCase.launch();
  }
}