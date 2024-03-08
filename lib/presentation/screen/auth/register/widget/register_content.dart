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
  late FocusNode _usernameFocusNode;

  @override
  void initState() {
    _usernameFocusNode = FocusNode();
    _usernameFocusNode.addListener(_onFocusNodeEvent);
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
        focusNode: _usernameFocusNode,
        hintText: StringManager.usernameHint,
        prefixIcon: Icons.person,
      ),
    ],
  );
}
