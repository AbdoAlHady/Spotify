import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_app/core/configs/assets/app_verctors.dart';
import 'package:spotify_app/core/widgets/basic_app_bar.dart';

import '../widgets/sign_in/sign_in_body.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: BasicAppBar(
        title: SvgPicture.asset(
          AppVerctors.logo,
          height: 33.h,
          width: 108.w,
        ),
      ),
      body: const SignInBody(),
    );
  }
}
