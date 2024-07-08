import 'package:flutter/material.dart';

import '../widgets/root_body.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: RootBody(),
    );
  }
}