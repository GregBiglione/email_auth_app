import 'package:email_auth_app/app/function.dart';
import 'package:email_auth_app/presentation/resource/color_manager.dart';
import 'package:email_auth_app/presentation/resource/string_manager.dart';
import 'package:email_auth_app/presentation/resource/value_manager.dart';
import 'package:email_auth_app/presentation/screen/auth/register/register_viewmodel.dart';
import 'package:email_auth_app/presentation/screen/auth/register/widget/password_strength_widget.dart';
import 'package:email_auth_app/presentation/widget/button_widget.dart';
import 'package:email_auth_app/presentation/widget/text_form_field_widget.dart';
import 'package:email_auth_app/presentation/widget/title_widget.dart';
import 'package:flutter/material.dart';

class RegisterContent extends StatefulWidget {
  final RegisterViewModel viewModel;

  const RegisterContent({super.key, required this.viewModel});

  @override
  State<RegisterContent> createState() => _RegisterContentState();
}

class _RegisterContentState extends State<RegisterContent> {

  onChangedPassword(String password) {
    setState(() {
      widget.viewModel.is8Characters = false;
      widget.viewModel.percentage = 0.0;
      if(password.length >= 8 && containBlank(password)) widget.viewModel.is8Characters = true;
      if(widget.viewModel.is8Characters == true) widget.viewModel.percentage += 0.2;

      widget.viewModel.isUppercase = false;
      if(containUppercase(password)) widget.viewModel.isUppercase = true;
      if(widget.viewModel.isUppercase == true) widget.viewModel.percentage += 0.2;

      widget.viewModel.isLowercase = false;
      if(containLowercase(password)) widget.viewModel.isLowercase = true;
      if(widget.viewModel.isLowercase == true) widget.viewModel.percentage += 0.2;

      widget.viewModel.isNumber = false;
      if(containNumber(password)) widget.viewModel.isNumber = true;
      if(widget.viewModel.isNumber == true) widget.viewModel.percentage += 0.2;

      widget.viewModel.isSpecialCharacter = false;
      if(containSpecialCharacter(password)) widget.viewModel.isSpecialCharacter = true;
      if(widget.viewModel.isSpecialCharacter == true) widget.viewModel.percentage += 0.2;
    });
  }

  @override
  void initState() {
    for(var f in widget.viewModel.focusNodeList) {
      f.addListener(_onFocusNodeEvent);
    }
    super.initState();
  }

  _onFocusNodeEvent() {
    setState(() {});
  }

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
        title: StringManager.registerTitle,
      ),
      const SizedBox(
        height: ValueManager.v16,
      ),
      // Username --------------------------------------------------------------
      TextFormFieldWidget(
        focusNode: widget.viewModel.focusNodeList[0],
        onChanged: (value) {
          widget.viewModel.setUsername(value);
        },
        error: widget.viewModel.state.username.error,
        textInputType: TextInputType.name,
        textInputAction: TextInputAction.next,
        hintText: StringManager.usernameHint,
        prefixIcon: Icons.person,
      ),
      const SizedBox(
        height: ValueManager.v10,
      ),
      // Email -----------------------------------------------------------------
      TextFormFieldWidget(
        focusNode: widget.viewModel.focusNodeList[1],
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
        focusNode: widget.viewModel.focusNodeList[2],
        onChanged: (value) {
          widget.viewModel.setPassword(value);
          onChangedPassword(value);
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
      // Progress bar & chevron ------------------------------------------------
      PasswordStrengthWidget(
        is8Characters: widget.viewModel.is8Characters,
        isUppercase: widget.viewModel.isUppercase,
        isLowercase: widget.viewModel.isLowercase,
        isNumber: widget.viewModel.isNumber,
        isSpecialCharacter: widget.viewModel.isSpecialCharacter,
        percentage: widget.viewModel.percentage,
      ),
      const SizedBox(
        height: ValueManager.v10,
      ),
      // Confirm password ------------------------------------------------------
      TextFormFieldWidget(
        isObscuredText: widget.viewModel.isObscuredConfirmedText,
        focusNode: widget.viewModel.focusNodeList[3],
        onChanged: (value) {
          widget.viewModel.setConfirmPassword(value);
        },
        error: widget.viewModel.state.confirmPassword.error,
        textInputType: TextInputType.visiblePassword,
        textInputAction: TextInputAction.send,
        hintText: StringManager.confirmPasswordHint,
        prefixIcon: Icons.lock,
        onTap: () {
          toggleConfirmPassword();
        },
      ),
      const SizedBox(
        height: ValueManager.v10,
      ),
      // Register button -------------------------------------------------------
      ButtonWidget(
        onPressed: () {
          widget.viewModel.register();
        },
        backgroundColor: ColorManager.primary,
        width: ValueManager.infinity,
        height: ValueManager.v50,
        buttonText: StringManager.registerTitle,
        textStyle: Theme.of(context).textTheme.titleMedium!,
      ),
    ],
  );

  //----------------------------------------------------------------------------
  // Toggle password
  //----------------------------------------------------------------------------

  void togglePassword() {
    setState(() {
      widget.viewModel.isObscuredText = !widget.viewModel.isObscuredText;
    });
  }

  //----------------------------------------------------------------------------
  // Toggle confirm password
  //----------------------------------------------------------------------------

  void toggleConfirmPassword() {
    setState(() {
      widget.viewModel.isObscuredConfirmedText = !widget.viewModel.isObscuredConfirmedText;
    });
  }
}
