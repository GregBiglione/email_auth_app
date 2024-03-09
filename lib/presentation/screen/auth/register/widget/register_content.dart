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
        hintText: StringManager.usernameHint,
        prefixIcon: Icons.person,
      ),
      const SizedBox(
        height: ValueManager.v10,
      ),
      // Email -----------------------------------------------------------------
      TextFormFieldWidget(
        focusNode: focusNodeList[1],
        hintText: StringManager.emailHint,
        prefixIcon: Icons.email,
      ),
      const SizedBox(
        height: ValueManager.v10,
      ),
      // Password --------------------------------------------------------------
      TextFormFieldWidget(
        focusNode: focusNodeList[2],
        hintText: StringManager.passwordHint,
        prefixIcon: Icons.lock,
      ),
      const SizedBox(
        height: ValueManager.v10,
      ),
      // Confirm password ------------------------------------------------------
      TextFormFieldWidget(
        focusNode: focusNodeList[3],
        hintText: StringManager.confirmPasswordHint,
        prefixIcon: Icons.lock,
      ),
      const SizedBox(
        height: ValueManager.v10,
      ),
    ],
  );
}
