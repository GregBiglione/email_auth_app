import 'package:email_auth_app/presentation/widget/padding_widget.dart';
import 'package:flutter/material.dart';

import '../resource/color_manager.dart';
import '../resource/value_manager.dart';

class TextFormFieldWidget extends StatelessWidget {
  final FocusNode focusNode;
  final String hintText;
  final IconData prefixIcon;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final GestureDetector? suffixIcon;
  final bool? isObscuredText;
  final Function(String text) onChanged;
  final String error;

  const TextFormFieldWidget({super.key, required this.focusNode,
    required this.hintText, required this.prefixIcon, required this.textInputType,
    required this.textInputAction, this.suffixIcon, this.isObscuredText,
    required this.onChanged, required this.error});

  @override
  Widget build(BuildContext context) {
    return PaddingWidget(
      widget: TextFormField(
        obscureText: isObscuredText ?? false,
        focusNode: focusNode,
        onChanged: (value) {
          onChanged(value);
        },
        keyboardType: textInputType,
        textInputAction: textInputAction,
        style: Theme.of(context).textTheme.displaySmall,
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: focusNode.hasFocus
                ? Theme.of(context).textTheme.titleLarge
                : Theme.of(context).textTheme.displaySmall,
            prefixIcon: Icon(
              prefixIcon,
              color: focusNode.hasFocus
                  ? ColorManager.primary
                  : ColorManager.disableColor,
              size: ValueManager.v30,
            ),
          suffixIcon: suffixIcon,
          errorText: error,
        ),
      )
    );
  }
}
