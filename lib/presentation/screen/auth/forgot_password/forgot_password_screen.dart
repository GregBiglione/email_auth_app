import 'dart:io';

import 'package:email_auth_app/app/function.dart';
import 'package:email_auth_app/domain/utils/state_render.dart';
import 'package:email_auth_app/presentation/resource/color_manager.dart';
import 'package:email_auth_app/presentation/resource/route_manager.dart';
import 'package:email_auth_app/presentation/resource/string_manager.dart';
import 'package:email_auth_app/presentation/screen/auth/forgot_password/forgot_password_viewmodel.dart';
import 'package:email_auth_app/presentation/screen/auth/forgot_password/widget/forgot_password_content.dart';
import 'package:email_auth_app/presentation/screen/loading/loading_screen.dart';
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
          child: StreamBuilder(
            stream: viewModel.response,
            builder: (context, snapshot) {
              final response = snapshot.data;
              viewModel.isErrorDisplayed = false;

              if(response is Success) {
                goTo(
                  Routes.loginRoute,
                  context,
                  StringManager.emailSentSuccessfully,
                );
              }
              else if(response is Loading) {
                return const LoadingScreen();
              }
              else if(response is Error) {
                final data = response;
                String error = StringManager.error + data.error;
                viewModel.isErrorDisplayed = !viewModel.isErrorDisplayed;

                if(viewModel.isErrorDisplayed = true) {
                  delayedErrorToast(context, error, 1000);
                }
              }

              return ForgotPasswordContent(viewModel: viewModel,);
            },
          ),
        ),
      ),
    );
  }
}
