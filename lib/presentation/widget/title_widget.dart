import 'package:email_auth_app/presentation/widget/padding_widget.dart';
import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  final String title;

  const TitleWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return PaddingWidget(
      widget: Text(
        title,
        style: Theme.of(context).textTheme.displayMedium,
      )
    );
  }
}
