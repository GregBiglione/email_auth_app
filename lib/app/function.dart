import 'package:email_auth_app/app/di/injection.dart';
import 'package:email_auth_app/app/regex.dart';
import 'package:email_auth_app/domain/usecase/auth/auth_usecase.dart';
import 'package:email_auth_app/main.dart';
import 'package:email_auth_app/presentation/resource/color_manager.dart';
import 'package:email_auth_app/presentation/resource/route_manager.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

// Check email -----------------------------------------------------------------

bool isEmailValid(String email) {
  return EmailValidator.validate(email);
}

// Error toast -----------------------------------------------------------------

void errorToast(BuildContext context, String message) => toastification.show(
  context: context,
  title: Text(message),
  autoCloseDuration: const Duration(seconds: 2),
  type: ToastificationType.error,
  style: ToastificationStyle.fillColored,
  showProgressBar: false,
  alignment: Alignment.bottomCenter,
  backgroundColor: ColorManager.error,
);

// Success toast ---------------------------------------------------------------

void successToast(BuildContext context, String message) => toastification.show(
  context: context,
  title: Text(message),
  autoCloseDuration: const Duration(seconds: 2),
  type: ToastificationType.success,
  style: ToastificationStyle.fillColored,
  showProgressBar: false,
  alignment: Alignment.bottomCenter,
);

// Delayed toast ---------------------------------------------------------------

void delayedErrorToast(BuildContext context, String message, int duration) {
  Future.delayed(
    Duration(milliseconds: duration),
    () {
      errorToast(context, message);
    }
  );
}

// Go to home screen -----------------------------------------------------------

void goToHomeScreen(BuildContext context) => WidgetsBinding.instance
    .addPostFrameCallback((timeStamp) {
      Navigator.pushReplacementNamed(
        context,
        Routes.homeRoute,
      );
});

// Go to screen ----------------------------------------------------------------

void goTo(String route, BuildContext context, String message) => WidgetsBinding
    .instance.addPostFrameCallback((timeStamp) {
      successToast(context, message);

      Navigator.pushReplacementNamed(
        context,
        route,
      );
});

// Password strength check -----------------------------------------------------

bool isPasswordEnoughStrength(String password) {
  return Regex.password.hasMatch(password);
}

bool containUppercase(String password) {
  return Regex.uppercase.hasMatch(password);
}

bool containLowercase(String password) {
  return Regex.lowercase.hasMatch(password);
}

bool containNumber(String password) {
  return Regex.number.hasMatch(password);
}

bool containSpecialCharacter(String password) {
  return Regex.specialCharacter.hasMatch(password);
}

bool containBlank(String password) {
  return !Regex.blankCharacter.hasMatch(password);
}

// Go to main after logout -----------------------------------------------------

void logoutNavigation(BuildContext context) =>
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => MyApp(getIt<AuthUseCase>()),
      ),
      (route) => false,
    );