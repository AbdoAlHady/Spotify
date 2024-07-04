import 'package:flutter/material.dart';
import 'package:spotify_app/features/spalsh/presentation/screens/spalsh_screen.dart';

import 'core/configs/theme/app_theme.dart';

class SpotifyApp extends StatelessWidget {
  const SpotifyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const SplashScreen(),
    );
  }
}
