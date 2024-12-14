import 'package:flutter/material.dart';
import 'package:spotify_app/core/extension/extension.dart';
import 'package:spotify_app/core/services/cache_helper.dart';
import 'package:spotify_app/core/utils/shared_preferences_keys.dart';

import '../../../../core/routing/routes.dart';
import '../widgets/splash_body.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    redirectScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplashBody(),
    );
  }

  void redirectScreen() {
    Future.delayed(const Duration(seconds: 2), () {
      if (CacheHelper().getData(key: SharedPreferencesKeys.isFirstTime) !=
          null) {
        if (CacheHelper().getData(key: SharedPreferencesKeys.isFirstTime) ==
            true) {
          if (CacheHelper().getData(key: SharedPreferencesKeys.userId) !=
              null) {
            context.pushReplacementNamed(Routes.homeScreen);
          } else {
            context.pushReplacementNamed(Routes.signupOrSigninScreen);
          }
        }
      } else {
        context.pushReplacementNamed(Routes.onBoardingScreen);
      }
    });
  }
}
