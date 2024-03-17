import 'package:email_auth_app/presentation/resource/color_manager.dart';
import 'package:email_auth_app/presentation/resource/value_manager.dart';
import 'package:email_auth_app/presentation/widget/padding_widget.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final Function()? onPressed;
  final Color backgroundColor;
  final double width;
  final double height;
  final String buttonText;
  final TextStyle textStyle;

  const ButtonWidget({super.key, required this.onPressed,
    required this.backgroundColor, required this.width, required this.height,
    required this.buttonText, required this.textStyle});

  @override
  Widget build(BuildContext context) {
    return PaddingWidget(
      widget: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          disabledBackgroundColor: ColorManager.disableColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              ValueManager.v30,
            ),
          ),
          minimumSize: Size(
            width,
            height,
          ),
        ),
        child: Text(
          buttonText,
          style: textStyle,
        ),
      ),
    );
  }
}
