import 'package:email_auth_app/presentation/resource/color_manager.dart';
import 'package:email_auth_app/presentation/resource/string_manager.dart';
import 'package:email_auth_app/presentation/resource/value_manager.dart';
import 'package:email_auth_app/presentation/widget/text_form_field_widget.dart';
import 'package:email_auth_app/presentation/widget/title_widget.dart';
import 'package:flutter/material.dart';

class RegisterContent extends StatefulWidget {
  const RegisterContent({super.key});

  @override
  State<RegisterContent> createState() => _RegisterContentState();
}

class _RegisterContentState extends State<RegisterContent> {
  List<FocusNode> focusNodeList = [
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
  ];
  bool isObscuredText = true;
  bool isObscuredConfirmedText = true;

  @override
  void initState() {
    for(var f in focusNodeList) {
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
        focusNode: focusNodeList[0],
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
        focusNode: focusNodeList[1],
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
        isObscuredText: isObscuredText,
        focusNode: focusNodeList[2],
        textInputType: TextInputType.visiblePassword,
        textInputAction: TextInputAction.next,
        hintText: StringManager.passwordHint,
        prefixIcon: Icons.lock,
        suffixIcon: GestureDetector(
          onTap: () {
            togglePassword();
          },
          child: Icon(
              isObscuredText
                  ? Icons.visibility
                  : Icons.visibility_off,
            color: focusNodeList[2].hasFocus
                ? ColorManager.primary
                : ColorManager.disableColor
          ),
        ),
      ),
      const SizedBox(
        height: ValueManager.v10,
      ),
      // Confirm password ------------------------------------------------------
      TextFormFieldWidget(
        isObscuredText: isObscuredConfirmedText,
        focusNode: focusNodeList[3],
        textInputType: TextInputType.visiblePassword,
        textInputAction: TextInputAction.send,
        hintText: StringManager.confirmPasswordHint,
        prefixIcon: Icons.lock,
        suffixIcon: GestureDetector(
          onTap: () {
            toggleConfirmPassword();
          },
          child: Icon(
              isObscuredConfirmedText
                  ? Icons.visibility
                  : Icons.visibility_off,
              color: focusNodeList[3].hasFocus
                  ? ColorManager.primary
                  : ColorManager.disableColor
          ),
        ),
      ),
      const SizedBox(
        height: ValueManager.v10,
      ),
    ],
  );

  //----------------------------------------------------------------------------
  // Toggle password
  //----------------------------------------------------------------------------

  void togglePassword() {
    setState(() {
      isObscuredText = !isObscuredText;
    });
  }

  //----------------------------------------------------------------------------
  // Toggle confirm password
  //----------------------------------------------------------------------------

  void toggleConfirmPassword() {
    setState(() {
      isObscuredConfirmedText = !isObscuredConfirmedText;
    });
  }
}
