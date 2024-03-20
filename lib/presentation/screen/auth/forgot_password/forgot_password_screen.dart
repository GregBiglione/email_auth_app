import 'dart:io';

import 'package:email_auth_app/presentation/resource/color_manager.dart';
import 'package:email_auth_app/presentation/screen/auth/forgot_password/forgot_password_viewmodel.dart';
import 'package:email_auth_app/presentation/screen/auth/forgot_password/widget/forgot_password_content.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ForgotPasswordViewModel viewModel = Provider.of<ForgotPasswordViewModel>(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorManager.black,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Platform.isAndroid
                  ? Icons.arrow_back
                  : Icons.arrow_back_ios,
              color: ColorManager.white,
            ),
          ),
        ),
        backgroundColor: ColorManager.black,
        body: Center(
          child: ForgotPasswordContent(viewModel: viewModel,),
        ),
      ),
    );
  }
}
