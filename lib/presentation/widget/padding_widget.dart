import 'package:flutter/material.dart';

import '../resource/value_manager.dart';

class PaddingWidget extends StatelessWidget {
  final Widget widget;

  const PaddingWidget({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: ValueManager.v16,
        right: ValueManager.v16,
      ),
      child: widget,
    );
  }
}
