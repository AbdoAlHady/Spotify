import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:spotify_app/core/configs/assets/app_verctors.dart';
import 'package:spotify_app/core/extension/extension.dart';
import 'package:spotify_app/core/helpers/app_loaders.dart';
import 'package:spotify_app/core/routing/routes.dart';
import 'package:spotify_app/features/auth/presentation/cubit/signup_cubit/signup_cubit.dart';
import 'package:spotify_app/features/auth/presentation/widgets/sign_up/sign_up_body.dart';
import '../../../../../core/widgets/basic_app_bar.dart';
import '../../cubit/signup_cubit/signup_state.dart';

class SignUpBodyBlocConsumer extends StatelessWidget {
  const SignUpBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) async {
        if (state is SuccessState) {
           
          context.pushNamed(Routes.rootScreen);
          AppLoaders.showToastError(
              context: context, message: 'Account created successfully!');
        } else if (state is FailureState) {
          AppLoaders.showToastError(
              context: context, message: state.message, second: 5);
        }
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
            body: const SignUpBody(),
          ),
        );
      },
    );
  }
}
