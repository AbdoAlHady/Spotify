import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:spotify_app/core/configs/assets/app_verctors.dart';
import 'package:spotify_app/core/extension/extension.dart';
import 'package:spotify_app/core/helpers/app_loaders.dart';
import 'package:spotify_app/core/routing/routes.dart';
import 'package:spotify_app/core/utils/app_strings.dart';
import 'package:spotify_app/common/widgets/basic_app_bar.dart';
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
        if (state is SuccessState) {
          context.pushNamedAndRemoveUntil(Routes.homeScreen, predicate: (route) => false);
          AppLoaders.showToastSuccess(context: context, message: AppStrings.sucessSignIn);
        }else if (state is FailureState){
          AppLoaders.showToastError(context: context, message: state.message);}
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is LoadingState,
          child: Scaffold(
            appBar: BasicAppBar(
              title: SvgPicture.asset(
                AppVerctors.logo,
                height: 33.h,
                width: 108.w,
              ),
            ),
            body: const SignInBody(),
          ),
        );
      },
    );
  }
}
