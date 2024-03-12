import 'package:email_auth_app/app/di/injection.dart';
import 'package:email_auth_app/domain/usecase/auth_usecase.dart';

import 'package:email_auth_app/presentation/resource/route_manager.dart';
import 'package:email_auth_app/presentation/resource/theme_manager.dart';
import 'package:email_auth_app/presentation/screen/auth/register/register_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => RegisterViewModel(getIt<AuthUseCase>()),
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