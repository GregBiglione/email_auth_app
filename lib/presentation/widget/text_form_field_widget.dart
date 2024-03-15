import 'package:email_auth_app/presentation/widget/padding_widget.dart';
import 'package:flutter/material.dart';

import '../resource/color_manager.dart';
import '../resource/style_manager.dart';
import '../resource/value_manager.dart';

class TextFormFieldWidget extends StatelessWidget {
  final FocusNode focusNode;
  final String hintText;
  final IconData prefixIcon;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final bool? isObscuredText;
  final Function(String text) onChanged;
  final String error;
  final Function()? onTap;

  const TextFormFieldWidget({super.key, required this.focusNode,
    required this.hintText, required this.prefixIcon, required this.textInputType,
    required this.textInputAction, this.isObscuredText,
    required this.onChanged, required this.error, this.onTap});

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
                  ? error.isEmpty
                    ? ColorManager.primary
                    : ColorManager.error
                  : ColorManager.disableColor,
              size: ValueManager.v30,
            ),
          suffixIcon: isObscuredText != null ? GestureDetector(
            onTap: onTap,
            child: Icon(
                isObscuredText!
                    ? Icons.visibility
                    : Icons.visibility_off,
                color: focusNode.hasFocus
                    ? error.isEmpty
                        ? ColorManager.primary
                        : ColorManager.error
                    : ColorManager.disableColor
            ),
          ) : null,
          errorText: error,
          errorStyle: getRegularStyle(
            color:  error.isEmpty
                ? ColorManager.primary
                : ColorManager.error,
          ),
          // Error border ------------------------------------------------------
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: error.isEmpty
                  ? ColorManager.disableColor
                  : ColorManager.error,
              width: ValueManager.v2,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(
                ValueManager.v8,
              ),
            ),
          ),
          // Focused error border ----------------------------------------------
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: error.isEmpty
                  ? ColorManager.primary
                  : ColorManager.error,
              width: ValueManager.v2,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(
                ValueManager.v8,
              ),
            ),
          ),
        ),
      )
    );
  }
}
