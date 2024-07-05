import 'package:flutter/material.dart';
import 'package:spotify_app/core/routing/routes.dart';
import 'package:spotify_app/features/auth/presentation/screens/signup_or_signin_screen.dart';
import 'package:spotify_app/features/choose_mode/presentation/screens/choose_mode_screen.dart';
import 'package:spotify_app/features/intro/presentation/screens/intro_screen.dart';
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
          builder: (_) => const IntroScreen(),
        );

      case Routes.chooseModeScreen:
        return MaterialPageRoute(
          builder: (_) => const ChooseModeScreen(),
        );
      case Routes.signupOrSigninScreen:
        return MaterialPageRoute(
          builder: (_) => const SignupOrSigninScreen(),
        );

      default:
        return null;
    }
  }
}
