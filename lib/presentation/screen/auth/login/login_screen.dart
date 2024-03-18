import 'package:email_auth_app/presentation/resource/color_manager.dart';
import 'package:email_auth_app/presentation/screen/auth/login/widget/login_content.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorManager.black,
        body: const Center(
          child: LoginContent(),
        ),
      ),
    );
  }
}
