import 'package:email_auth_app/presentation/resource/color_manager.dart';
import 'package:email_auth_app/presentation/resource/string_manager.dart';
import 'package:email_auth_app/presentation/resource/value_manager.dart';
import 'package:flutter/material.dart';

class RegisterContent extends StatefulWidget {
  const RegisterContent({super.key});

  @override
  State<RegisterContent> createState() => _RegisterContentState();
}

class _RegisterContentState extends State<RegisterContent> {
  @override
  Widget build(BuildContext context) {
    return _getContentWidget();
  }

  //----------------------------------------------------------------------------
  // All content
  //----------------------------------------------------------------------------

  Widget _getContentWidget() => Padding(
    padding: EdgeInsets.only(
      left: ValueManager.v16,
      right: ValueManager.v16,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _registerTitleWidget(),
        const SizedBox(
          height: ValueManager.v16,
        ),
        _usernameWidget(),
      ],
    ),
  );

  //----------------------------------------------------------------------------
  // Title
  //----------------------------------------------------------------------------

  Widget _registerTitleWidget() => Padding(
    padding: EdgeInsets.only(
      left: ValueManager.v16,
      right: ValueManager.v16,
    ),
    child: Text(
      StringManager.registerTitle,
      style: Theme.of(context).textTheme.displayMedium,
    )
  );

  //----------------------------------------------------------------------------
  // Username
  //----------------------------------------------------------------------------

  Widget _usernameWidget() => Padding(
      padding: EdgeInsets.only(
        left: ValueManager.v16,
        right: ValueManager.v16,
      ),
      child: TextFormField(
        keyboardType: TextInputType.name,
        style: Theme.of(context).textTheme.displaySmall,
        decoration: InputDecoration(
          hintText: StringManager.usernameHint,
          hintStyle: Theme.of(context).textTheme.displaySmall,
          prefixIcon: Icon(
            Icons.person,
            color: ColorManager.disableColor,
            size: ValueManager.v30,
          )
        ),
      )
  );
}
