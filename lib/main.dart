import 'package:email_auth_app/app/di/injection.dart';
import 'package:email_auth_app/domain/usecase/auth_usecase.dart';

import 'package:email_auth_app/presentation/resource/route_manager.dart';
import 'package:email_auth_app/presentation/resource/theme_manager.dart';
import 'package:email_auth_app/presentation/screen/auth/forgot_password/forgot_password_viewmodel.dart';
import 'package:email_auth_app/presentation/screen/auth/login/login_viewmodel.dart';
import 'package:email_auth_app/presentation/screen/auth/register/register_viewmodel.dart';
import 'package:email_auth_app/presentation/screen/home/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app/constant.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(MyApp(getIt<AuthUseCase>()));
}

class MyApp extends StatelessWidget {
  final AuthUseCase _authUseCase;

  const MyApp(this._authUseCase, {super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final String sessionId = _authUseCase.userSessionUseCase.userSession?.uid ?? "Not connected";

    logger.i("User session id $sessionId");

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => RegisterViewModel(getIt<AuthUseCase>()),
        ),
        ChangeNotifierProvider(
          create: (context) => LoginViewModel(getIt<AuthUseCase>()),
        ),
        ChangeNotifierProvider(
          create: (context) => ForgotPasswordViewModel(getIt<AuthUseCase>()),
        ),
        ChangeNotifierProvider(
          create: (context) => HomeViewModel(getIt<AuthUseCase>()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.splashRoute,
        onGenerateRoute: RouteGenerator.getRoute,
        theme: getApplicationTheme(),
      ),
    );
  }
}