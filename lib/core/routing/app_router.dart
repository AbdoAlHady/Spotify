import 'package:flutter/material.dart';
import 'package:spotify_app/core/routing/routes.dart';
import 'package:spotify_app/features/on_boarding/presentation/screens/on_boarding_screen.dart';
import 'package:spotify_app/features/spalsh/presentation/screens/spalsh_screen.dart';

class AppRouter {
  const AppRouter._();
  static const AppRouter _instance = AppRouter._();
  factory AppRouter() => _instance;

  Route? onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
          builder: (_) => const OnBoardingScreen(),
        );

      default:
        return null;
    }
  }
}
