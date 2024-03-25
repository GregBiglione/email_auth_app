import 'package:email_auth_app/app/function.dart';
import 'package:email_auth_app/domain/model/firestore_user.dart';
import 'package:email_auth_app/domain/utils/state_render.dart';
import 'package:email_auth_app/presentation/resource/color_manager.dart';
import 'package:email_auth_app/presentation/resource/font_manager.dart';
import 'package:email_auth_app/presentation/resource/string_manager.dart';
import 'package:email_auth_app/presentation/resource/style_manager.dart';
import 'package:email_auth_app/presentation/resource/value_manager.dart';
import 'package:email_auth_app/presentation/screen/home/home_viewmodel.dart';
import 'package:email_auth_app/presentation/screen/home/widget/home_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeViewModel viewModel = Provider.of<HomeViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManager.primary,
        automaticallyImplyLeading: false,
        title: StreamBuilder(
          stream: viewModel.getUser(),
          builder: (context, snapshot) {
            final response = snapshot.data;

            if(response is Success) {
              final user = response as Success<FireStoreUser>;

              return Text(
                StringManager.homeTitle + user.data.username,
                style: getBoldStyle(
                  fontSize: FontSize.s16,
                  color: ColorManager.white,
                ),
                overflow: TextOverflow.ellipsis,
              );
            }
            else if(response is Loading) {
              return SpinKitFadingCircle(
                color: ColorManager.primary,
                size: ValueManager.v40,
              );
            }
            else if(response is Error) {
              final data = response as Error;

              return Center(
                child: Text(
                  StringManager.error + data.error,
                  style: getRegularStyle(
                    fontSize: FontSize.s16,
                    color: ColorManager.error,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              );
            }

            return const SizedBox();
          }
        ),
        actions: [
          IconButton(
            onPressed: () {
              viewModel.logout();
              logoutNavigation(context);
            },
            icon: Icon(
              Icons.logout,
              color: ColorManager.white,
            ),
          ),
        ],
      ),
      backgroundColor: ColorManager.black,
      body: const HomeContent(),
    );
  }
}
