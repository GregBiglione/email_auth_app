import 'package:email_auth_app/presentation/screen/auth/login/login_viewmodel.dart';
import 'package:flutter/material.dart';

import '../../../../resource/color_manager.dart';
import '../../../../resource/route_manager.dart';
import '../../../../resource/string_manager.dart';
import '../../../../resource/value_manager.dart';
import '../../../../widget/button_widget.dart';
import '../../../../widget/clickable_link_widget.dart';
import '../../../../widget/text_form_field_widget.dart';
import '../../../../widget/title_widget.dart';

class LoginContent extends StatefulWidget {
  final LoginViewModel viewModel;

  const LoginContent({super.key, required this.viewModel});

  @override
  State<LoginContent> createState() => _LoginContentState();
}

class _LoginContentState extends State<LoginContent> {
  @override
  Widget build(BuildContext context) {
    return _getContentWidget();
  }

  //----------------------------------------------------------------------------
  // All content
  //----------------------------------------------------------------------------

  Widget _getContentWidget() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      // Title -----------------------------------------------------------------
      const TitleWidget(
        title: StringManager.loginTitle,
      ),
      const SizedBox(
        height: ValueManager.v16,
      ),
      // Email -----------------------------------------------------------------
      TextFormFieldWidget(
        focusNode: widget.viewModel.focusNodeList[0],
        onChanged: (value) {
          widget.viewModel.setEmail(value);
        },
        error: widget.viewModel.state.email.error,
        textInputType: TextInputType.emailAddress,
        textInputAction: TextInputAction.next,
        hintText: StringManager.emailHint,
        prefixIcon: Icons.email,
      ),
      const SizedBox(
        height: ValueManager.v10,
      ),
      // Password --------------------------------------------------------------
      TextFormFieldWidget(
        isObscuredText: widget.viewModel.isObscuredText,
        focusNode: widget.viewModel.focusNodeList[1],
        onChanged: (value) {
          widget.viewModel.setPassword(value);
        },
        error: widget.viewModel.state.password.error,
        textInputType: TextInputType.visiblePassword,
        textInputAction: TextInputAction.next,
        hintText: StringManager.passwordHint,
        prefixIcon: Icons.lock,
        onTap: () {
          togglePassword();
        },
      ),
      const SizedBox(
        height: ValueManager.v10,
      ),
      // Login button ----------------------------------------------------------
      ButtonWidget(
        onPressed: widget.viewModel.state.isValid() == true
            ? widget.viewModel.login
            : null,
        backgroundColor: ColorManager.primary,
        width: ValueManager.infinity,
        height: ValueManager.v50,
        buttonText: StringManager.loginTitle,
        textStyle: Theme.of(context).textTheme.titleMedium!,
      ),
      const SizedBox(
        height: ValueManager.v10,
      ),
      const ClickableLinkWidget(
        messagePart1: StringManager.registerMessage1,
        messagePart2: StringManager.registerMessage2,
        route: Routes.registerRoute,
        mainAxisAlignment: MainAxisAlignment.center,
      ),
    ],
  );

  //----------------------------------------------------------------------------
  // Toggle password
  //----------------------------------------------------------------------------

  void togglePassword() {
    setState(() {
      //widget.viewModel.isObscuredText = !widget.viewModel.isObscuredText;
    });
  }

}
