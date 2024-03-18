import 'package:flutter/material.dart';

import '../../../../resource/color_manager.dart';
import '../../../../resource/string_manager.dart';
import '../../../../resource/value_manager.dart';
import '../../../../widget/button_widget.dart';
import '../../../../widget/text_form_field_widget.dart';
import '../../../../widget/title_widget.dart';

class LoginContent extends StatefulWidget {
  const LoginContent({super.key});

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
        focusNode: FocusNode(),//widget.viewModel.focusNodeList[1],
        onChanged: (value) {
          //widget.viewModel.setEmail(value);
        },
        error: "Error email",//widget.viewModel.state.email.error,
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
        //isObscuredText: widget.viewModel.isObscuredText,
        focusNode: FocusNode(),//widget.viewModel.focusNodeList[2],
        onChanged: (value) {
          //widget.viewModel.setPassword(value);
        },
        error: "Error password",//widget.viewModel.state.password.error,
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
        onPressed: /*widget.viewModel.state.isValid() == true
            ? widget.viewModel.register
            : */null,
        backgroundColor: ColorManager.primary,
        width: ValueManager.infinity,
        height: ValueManager.v50,
        buttonText: StringManager.loginTitle,
        textStyle: Theme.of(context).textTheme.titleMedium!,
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
