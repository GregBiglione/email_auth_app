import 'package:email_auth_app/presentation/resource/color_manager.dart';
import 'package:email_auth_app/presentation/resource/string_manager.dart';
import 'package:email_auth_app/presentation/screen/auth/register/register_screen.dart';
import 'package:email_auth_app/presentation/screen/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static const splashRoute = "/";
  static const registerRoute = "/register";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch(routeSettings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.registerRoute:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text(
            StringManager.noRouteFound,
          ),
        ),
        body: Center(
          child: Text(
            StringManager.noRouteFound,
            style: Theme.of(_).textTheme.displaySmall,
          ),
        ),
        backgroundColor: ColorManager.black,
      ),
    );
  }
}