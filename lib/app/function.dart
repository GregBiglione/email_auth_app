import 'package:email_auth_app/app/regex.dart';
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