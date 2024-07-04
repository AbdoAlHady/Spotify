import 'package:flutter/material.dart';
import 'package:spotify_app/features/intro/presentation/widgets/intro_body.dart';


class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: IntroBody()
    );
  }
}
