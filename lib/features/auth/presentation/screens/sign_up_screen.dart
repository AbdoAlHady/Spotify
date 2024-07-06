import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_app/core/configs/assets/app_verctors.dart';

import '../../../../core/widgets/basic_app_bar.dart';
import '../widgets/sign_up/sign_up_body.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        title: SvgPicture.asset(
          AppVerctors.logo,
          height: 33.h,
          width: 108.w,
        ),
      ),
      body: const SignUpBody(),
    );
  }
}
