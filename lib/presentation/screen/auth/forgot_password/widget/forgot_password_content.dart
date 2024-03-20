import 'package:email_auth_app/presentation/screen/auth/forgot_password/forgot_password_viewmodel.dart';
import 'package:flutter/material.dart';

import '../../../../resource/color_manager.dart';
import '../../../../resource/string_manager.dart';
import '../../../../resource/value_manager.dart';
import '../../../../widget/button_widget.dart';
import '../../../../widget/text_form_field_widget.dart';
import '../../../../widget/title_widget.dart';

class ForgotPasswordContent extends StatefulWidget {
  final ForgotPasswordViewModel viewModel;

  const ForgotPasswordContent({super.key, required this.viewModel});

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
        focusNode: widget.viewModel.focusNode,
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
      // Send email button -----------------------------------------------------
      ButtonWidget(
        onPressed: widget.viewModel.state.isValid() == true
            && widget.viewModel.isErrorDisplayed == false
            ? widget.viewModel.resetPassword
            : null,
        backgroundColor: ColorManager.primary,
        width: ValueManager.infinity,
        height: ValueManager.v50,
        buttonText: StringManager.forgotPasswordTitle,
        textStyle: Theme.of(context).textTheme.titleMedium!,
      ),
    ],
  );
}
