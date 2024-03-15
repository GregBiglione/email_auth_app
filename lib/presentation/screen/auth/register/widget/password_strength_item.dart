import 'package:email_auth_app/presentation/resource/color_manager.dart';
import 'package:email_auth_app/presentation/resource/style_manager.dart';
import 'package:email_auth_app/presentation/resource/value_manager.dart';
import 'package:flutter/material.dart';

import '../../../../resource/font_manager.dart';

class PasswordStrengthItem extends StatelessWidget {
  final String text;
  final bool isInPassword;

  const PasswordStrengthItem(
      {super.key, required this.text, required this.isInPassword});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.check,
          color: isInPassword
              ? ColorManager.pickColor
              : ColorManager.disableColor,
          size: ValueManager.v25,
        ),
        const SizedBox(
          width: ValueManager.v10,
        ),
        Text(
          text,
          style: isInPassword
              ? getBoldStyle(
                  fontSize: FontSize.s16,
                  color: ColorManager.white,
                )
              : getRegularStyle(
                  fontSize: FontSize.s16,
                  color: ColorManager.disableColor,
                ),
        )
      ],
    );
  }
}
