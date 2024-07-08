import 'package:flutter/material.dart';

import '../widgets/siginup_or_signin_body.dart';

class SignupOrSigninScreen extends StatelessWidget {
  const SignupOrSigninScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SiginupOrSigninBody(),
    );
  }
}