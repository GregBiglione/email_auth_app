import 'package:flutter/material.dart';

import '../../../../resource/color_manager.dart';
import '../../../../resource/string_manager.dart';
import '../../../../resource/value_manager.dart';
import '../../../../widget/button_widget.dart';
import '../../../../widget/text_form_field_widget.dart';
import '../../../../widget/title_widget.dart';

class ForgotPasswordContent extends StatefulWidget {
  const ForgotPasswordContent({super.key});

  @override
  State<ForgotPasswordContent> createState() => _ForgotPasswordContentState();
}

class _ForgotPasswordContentState extends State<ForgotPasswordContent> {
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
        title: StringManager.forgotPasswordTitle,
      ),
      const SizedBox(
        height: ValueManager.v16,
      ),
      // Email -----------------------------------------------------------------
      TextFormFieldWidget(
        focusNode: FocusNode(),//widget.viewModel.focusNodeList[0],
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
      // Send email button -----------------------------------------------------
      ButtonWidget(
        onPressed: /*widget.viewModel.state.isValid() == true
            && widget.viewModel.isErrorDisplayed == false
            ? widget.viewModel.login
            :*/ null,
        backgroundColor: ColorManager.primary,
        width: ValueManager.infinity,
        height: ValueManager.v50,
        buttonText: StringManager.forgotPasswordTitle,
        textStyle: Theme.of(context).textTheme.titleMedium!,
      ),
    ],
  );
}
