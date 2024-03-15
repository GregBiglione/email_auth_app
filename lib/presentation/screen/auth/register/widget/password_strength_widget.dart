import 'dart:math';

import 'package:email_auth_app/presentation/resource/color_manager.dart';
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
  final bool isClicked = false;
  final bool isVisible = false;

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

          },
        ),
      ],
    );
  }
}
