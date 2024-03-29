import 'dart:async';

import 'package:email_auth_app/presentation/resource/color_manager.dart';
import 'package:email_auth_app/presentation/resource/font_manager.dart';
import 'package:email_auth_app/presentation/resource/image_manager.dart';
import 'package:email_auth_app/presentation/resource/route_manager.dart';
import 'package:email_auth_app/presentation/resource/string_manager.dart';
import 'package:email_auth_app/presentation/resource/style_manager.dart';
import 'package:email_auth_app/presentation/resource/value_manager.dart';
import 'package:flutter/material.dart';

import '../../../app/app_preferences.dart';
import '../../../app/di/injection.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? timer;
  final AppPreferences _appPreferences = getIt<AppPreferences>();

  //----------------------------------------------------------------------------
  // Go to Login/Home screen
  //----------------------------------------------------------------------------

  _goToLoginScreen() {
    _appPreferences.isUserLogged().then((value) {
      if(value == false) {
        Navigator.pushReplacementNamed(
          context,
          Routes.loginRoute,
        );
      }
      else {
        Navigator.pushReplacementNamed(
          context,
          Routes.homeRoute,
        );
      }
    });
  }

  //----------------------------------------------------------------------------
  // Start timer
  //----------------------------------------------------------------------------

  _startTimer() {
    timer = Timer(
      const Duration(seconds: 2),
      _goToLoginScreen
    );
  }

  @override
  void initState() {
    _startTimer();
    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              ImageManager.splashLogo,
              width: ValueManager.v100,
              height: ValueManager.v100,
            ),
            const SizedBox(
              height: ValueManager.v10,
            ),
            Text(
              StringManager.appName,
              style: getBoldStyle(
                fontSize: FontSize.s20,
                color: ColorManager.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
