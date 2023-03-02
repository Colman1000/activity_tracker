import 'package:activity_tracker/config/colors.dart';
import 'package:activity_tracker/config/constants.dart';
import 'package:activity_tracker/config/routes/routes.dart';
import 'package:activity_tracker/config/theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Activity Tracker',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.lightTheme,
      themeAnimationCurve: Constants.curve,
      color: AppColors.brandPrimary(context),
      themeAnimationDuration: Constants.duration,
      scaffoldMessengerKey: Constants.scaffoldMessengerKey,
      debugShowCheckedModeBanner: false,
      routerConfig: GoRouter(
        routes: $appRoutes,
        debugLogDiagnostics: true,
      ),
    );
  }
}
