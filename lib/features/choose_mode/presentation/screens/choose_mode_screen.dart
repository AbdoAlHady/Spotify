import 'package:flutter/material.dart';

import '../widgets/choose_mode_body.dart';

class ChooseModeScreen extends StatelessWidget {
  const ChooseModeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ChooseModeBody(),
    );
  }
}