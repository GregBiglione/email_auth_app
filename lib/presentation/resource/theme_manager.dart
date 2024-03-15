import 'package:email_auth_app/presentation/resource/color_manager.dart';
import 'package:email_auth_app/presentation/resource/font_manager.dart';
import 'package:email_auth_app/presentation/resource/style_manager.dart';
import 'package:email_auth_app/presentation/resource/value_manager.dart';
import 'package:flutter/material.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    // App colors --------------------------------------------------------------
    primaryColor: ColorManager.primary,
    primaryColorLight: ColorManager.primaryOpacity70,
    primaryColorDark: ColorManager.primaryDark,
    disabledColor: ColorManager.disableColor,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: ColorManager.disableColor,
    ),

    // Text theme --------------------------------------------------------------
    textTheme: TextTheme(
      // Headline 1 ------------------------------------------------------------
      displayMedium: getRegularStyle(
        fontSize: FontSize.s24,
        color: ColorManager.white,
      ),

      // Headline 2 ------------------------------------------------------------
      displaySmall: getRegularStyle(
        fontSize: FontSize.s16,
        color: ColorManager.disableColor,
      ),

      // Headline 3 ------------------------------------------------------------
      headlineMedium: getBoldStyle(
        fontSize: FontSize.s16,
        color: ColorManager.grey60,
      ),

      // Headline 4 ------------------------------------------------------------
      headlineSmall: getRegularStyle(
        color: ColorManager.grey60,
      ),

      // Headline 5 ------------------------------------------------------------
      titleLarge: getRegularStyle(
        fontSize: FontSize.s16,
        color: ColorManager.primary,
      ),

      // Headline 6 ------------------------------------------------------------
      titleMedium: getRegularStyle(
        fontSize: FontSize.s18,
        color: ColorManager.white,
      ),

      // Subtitle 1 ------------------------------------------------------------
      titleSmall: getMediumStyle(
        fontSize: FontSize.s14,
        color: ColorManager.primary,
      ),

      // Subtitle 2 ------------------------------------------------------------
      bodyLarge: getBoldStyle(
        color: ColorManager.grey30,
      ),

      // Body text 2 -----------------------------------------------------------
      bodySmall: getBoldStyle(
        color: ColorManager.grey30,
      ),
    ),

    // Input text form field ---------------------------------------------------
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(
        ValueManager.v8,
      ),
      hintStyle: getRegularStyle(
        color: ColorManager.disableColor,
      ),
      labelStyle: getMediumStyle(
        color: ColorManager.disableColor,
      ),

      // Border ----------------------------------------------------------------
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.disableColor,
          width: ValueManager.v2,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(
            ValueManager.v8,
          ),
        ),
      ),
      // Focused border --------------------------------------------------------
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorManager.primary,
            width: ValueManager.v2,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(
              ValueManager.v8,
            ),
          ),
      ),
    ),
  );
}