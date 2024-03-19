import 'package:email_auth_app/app/constant.dart';
import 'package:email_auth_app/app/function.dart';
import 'package:email_auth_app/presentation/resource/color_manager.dart';
import 'package:email_auth_app/presentation/resource/string_manager.dart';
import 'package:email_auth_app/presentation/screen/auth/register/register_viewmodel.dart';
import 'package:email_auth_app/presentation/screen/auth/register/widget/register_content.dart';
import 'package:email_auth_app/presentation/screen/loading/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../domain/utils/state_render.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    RegisterViewModel viewModel = Provider.of<RegisterViewModel>(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorManager.black,
        body: Center(
          child: SingleChildScrollView(
            child: StreamBuilder(
              stream: viewModel.response,
              builder: (context, snapshot) {
                final response = snapshot.data;
                viewModel.isErrorDisplayed = false;

                if(response is Success) {
                  logger.i("User data: $response");
                  goToHomeScreen(context);
                }
                else if(response is Loading) {
                  logger.w("Loading...");
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

                return RegisterContent(viewModel: viewModel,);
              },
            ),
          ),
        ),
      ),
    );
  }
}
