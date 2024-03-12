import 'package:email_auth_app/presentation/resource/color_manager.dart';
import 'package:email_auth_app/presentation/screen/auth/register/register_viewmodel.dart';
import 'package:email_auth_app/presentation/screen/auth/register/widget/register_content.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
            child: RegisterContent(viewModel: viewModel,),
          ),
        ),
      ),
    );
  }
}
