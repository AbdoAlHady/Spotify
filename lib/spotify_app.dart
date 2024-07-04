import 'package:flutter/material.dart';
import 'package:spotify_app/core/routing/app_router.dart';
import 'package:spotify_app/core/routing/routes.dart';

import 'core/configs/theme/app_theme.dart';

class SpotifyApp extends StatelessWidget {
  const SpotifyApp({super.key, required this.appRouter});
  final AppRouter appRouter;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      onGenerateRoute: appRouter.onGenerateRoute,
      initialRoute: Routes.splashScreen,
    );
  }
}
