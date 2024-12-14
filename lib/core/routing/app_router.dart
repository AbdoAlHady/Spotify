import 'package:flutter/material.dart';
import 'package:spotify_app/core/routing/routes.dart';
import 'package:spotify_app/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:spotify_app/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:spotify_app/features/auth/presentation/screens/signup_or_signin_screen.dart';
import 'package:spotify_app/features/choose_mode/presentation/screens/choose_mode_screen.dart';
import 'package:spotify_app/features/home/domain/entities/song_entity.dart';
import 'package:spotify_app/features/intro/presentation/screens/intro_screen.dart';
import 'package:spotify_app/features/home/presentation/screens/home_screen.dart';
import 'package:spotify_app/features/song_player/presentation/screens/song_player_screen.dart';
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
      case Routes.signUpScreen:
        return MaterialPageRoute(
          builder: (_) => const SignUpScreen(),
        );
      case Routes.signInScreen:
        return MaterialPageRoute(
          builder: (_) => const SignInScreen(),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      case Routes.songPlayerScreen:
        return MaterialPageRoute(
          builder: (_) =>  SongPlayerScreen(song: args as SongEntity,),
        );

      default:
        return null;
    }
  }
}
