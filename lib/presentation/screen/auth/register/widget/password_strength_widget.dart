import 'dart:math';

import 'package:email_auth_app/presentation/resource/color_manager.dart';
import 'package:email_auth_app/presentation/resource/string_manager.dart';
import 'package:email_auth_app/presentation/screen/auth/register/widget/password_strength_item.dart';
import 'package:email_auth_app/presentation/widget/padding_widget.dart';
import 'package:flutter/material.dart';

class PasswordStrengthWidget extends StatefulWidget {
  final bool is8Characters;
  final bool isUppercase;
  final bool isLowercase;
  final bool isNumber;
  final bool isSpecialCharacter;
  final double percentage;

  const PasswordStrengthWidget({super.key, required this.is8Characters,
    required this.isUppercase, required this.isLowercase, required this.isNumber,
    required this.isSpecialCharacter, required this.percentage});

  @override
  State<PasswordStrengthWidget> createState() => _PasswordStrengthWidgetState();
}

class _PasswordStrengthWidgetState extends State<PasswordStrengthWidget> {
  bool isClicked = false;
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          child: PaddingWidget(
            widget: Row(
              children: [
                // Rotate chevron ----------------------------------------------
                Transform.rotate(
                  angle: isClicked
                    ? 0 * pi / 180
                    : 90 * pi / 180,
                  child: Icon(
                    Icons.chevron_right,
                    color: ColorManager.white,
                  ),
                ),
                // Linear progress indicator -----------------------------------
                Expanded(
                  child: LinearProgressIndicator(
                    value: widget.percentage,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      ColorManager.primaryOpacity70,
                    ),
                    backgroundColor: ColorManager.disableColor,
                  ),
                ),
              ],
            ),
          ),
          onTap: () {
            toggleRegexMenuIcon();
            toggleRegexPasswordVisibility();
          },
        ),
        // Password strength list ----------------------------------------------
        displayRegexPasswordList(),
      ],
    );
  }

  //----------------------------------------------------------------------------
  // Toggle regex menu icon
  //----------------------------------------------------------------------------

  void toggleRegexMenuIcon() => setState(() => isClicked = !isClicked);

  //----------------------------------------------------------------------------
  // Toggle regex password list visibility
  //----------------------------------------------------------------------------

  void toggleRegexPasswordVisibility() => setState(() => isVisible = !isVisible);

  //----------------------------------------------------------------------------
  // Regex password list
  //----------------------------------------------------------------------------

  Widget displayRegexPasswordList() => Visibility(
    visible: isVisible,
    child: PaddingWidget(
      widget: Column(
        children: [
          PasswordStrengthItem(
            text: StringManager.eightCharacter,
            isInPassword: widget.is8Characters,
          ),
          PasswordStrengthItem(
            text: StringManager.uppercase,
            isInPassword: widget.isUppercase,
          ),
          PasswordStrengthItem(
            text: StringManager.lowercase,
            isInPassword: widget.isLowercase,
          ),
          PasswordStrengthItem(
            text: StringManager.number,
            isInPassword: widget.isNumber,
          ),
          PasswordStrengthItem(
            text: StringManager.specialCharacter,
            isInPassword: widget.isSpecialCharacter,
          ),
        ],
      ),
    ),
  );

}
