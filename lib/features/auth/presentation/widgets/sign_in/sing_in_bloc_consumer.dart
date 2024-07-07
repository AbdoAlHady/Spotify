import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_app/core/configs/assets/app_verctors.dart';
import 'package:spotify_app/core/widgets/basic_app_bar.dart';
import 'package:spotify_app/features/auth/presentation/cubit/signin/signin_state.dart';
import 'package:spotify_app/features/auth/presentation/widgets/sign_in/sign_in_body.dart';

import '../../cubit/signin/signin_cubit.dart';

class SignInBlocConsumer extends StatelessWidget {
  const SignInBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SigninCubit, SigninState>(
      listener: (context, state) {
       
      },
      builder: (context, state) {
        return Scaffold(
          appBar: BasicAppBar(
            title: SvgPicture.asset(
              AppVerctors.logo,
              height: 33.h,
              width: 108.w,
            ),
          ),
          body: const SignInBody(),
        );
      },
    );
  }
}
