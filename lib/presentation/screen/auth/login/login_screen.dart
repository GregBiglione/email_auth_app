import 'package:email_auth_app/app/function.dart';
import 'package:email_auth_app/domain/utils/state_render.dart';
import 'package:email_auth_app/presentation/resource/color_manager.dart';
import 'package:email_auth_app/presentation/resource/string_manager.dart';
import 'package:email_auth_app/presentation/screen/auth/login/login_viewmodel.dart';
import 'package:email_auth_app/presentation/screen/auth/login/widget/login_content.dart';
import 'package:email_auth_app/presentation/screen/loading/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    LoginViewModel viewModel = Provider.of<LoginViewModel>(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorManager.black,
        body: Center(
          child: StreamBuilder(
            stream: viewModel.response,
            builder: (context, snapshot) {
              final response = snapshot.data;
              viewModel.isErrorDisplayed = false;

              if(response is Success) {
                goToHomeScreen(context);
              }
              else if(response is Loading) {
                return const LoadingScreen();
              }
              else if(response is Error) {
                final data = response;
                String error = StringManager.error + data.error;
                viewModel.isErrorDisplayed = !viewModel.isErrorDisplayed;

                if (viewModel.isErrorDisplayed = true) {
                  delayedErrorToast(context, error, 1000);
                }
              }

              return LoginContent(viewModel: viewModel,);
            },
          ),
        ),
      ),
    );
  }
}
