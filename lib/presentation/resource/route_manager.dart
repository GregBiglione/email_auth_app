import 'package:email_auth_app/presentation/resource/color_manager.dart';
import 'package:email_auth_app/presentation/resource/string_manager.dart';
import 'package:email_auth_app/presentation/screen/auth/forgot_password/forgot_password_screen.dart';
import 'package:email_auth_app/presentation/screen/auth/login/login_screen.dart';
import 'package:email_auth_app/presentation/screen/auth/register/register_screen.dart';
import 'package:email_auth_app/presentation/screen/home/home_screen.dart';
import 'package:email_auth_app/presentation/screen/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static const splashRoute = "/";
  static const registerRoute = "/register";
  static const loginRoute = "/login";
  static const forgotPasswordRoute = "/forgotPassword";
  static const homeRoute = "/home";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch(routeSettings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.registerRoute:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case Routes.forgotPasswordRoute:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordScreen());
      case Routes.homeRoute:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
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