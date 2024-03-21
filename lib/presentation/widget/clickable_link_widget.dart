import 'package:email_auth_app/presentation/resource/color_manager.dart';
import 'package:email_auth_app/presentation/resource/font_manager.dart';
import 'package:email_auth_app/presentation/resource/route_manager.dart';
import 'package:email_auth_app/presentation/resource/style_manager.dart';
import 'package:email_auth_app/presentation/widget/padding_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ClickableLinkWidget extends StatelessWidget {
  final String? messagePart1;
  final String messagePart2;
  final String route;
  final MainAxisAlignment mainAxisAlignment;

  const ClickableLinkWidget({super.key, this.messagePart1, required this.messagePart2,
    required this.route, required this.mainAxisAlignment});

  @override
  Widget build(BuildContext context) {
    return PaddingWidget(
      widget: Row(
        mainAxisAlignment: mainAxisAlignment,
        children: [
          RichText(
            text: TextSpan(
              children: [
                // Message part 1 ----------------------------------------------
                TextSpan(
                  text: messagePart1,
                  style: getRegularStyle(
                    fontSize: FontSize.s14,
                    color: ColorManager.white,
                  ),
                ),
                // Message part 2 ----------------------------------------------
                TextSpan(
                  text: messagePart2,
                  style: getRegularStyle(
                    fontSize: FontSize.s14,
                    color: ColorManager.primary,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      if(route == Routes.registerRoute) {
                        Navigator.pushNamed(
                          context,
                          route,
                        );
                      }
                      else {
                        Navigator.pop(context);
                      }
                    }
                ),
              ]
            ),
          ),
        ],
      ),
    );
  }
}
