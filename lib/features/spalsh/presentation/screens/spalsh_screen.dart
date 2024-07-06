import 'package:flutter/material.dart';
import 'package:spotify_app/core/extension/extension.dart';

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

  void redirectScreen(){
    Future.delayed(const Duration(seconds: 2), (){
      context.pushReplacementNamed(Routes.onBoardingScreen);
    });

  }
}
