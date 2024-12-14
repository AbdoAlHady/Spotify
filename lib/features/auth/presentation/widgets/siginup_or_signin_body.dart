import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_app/core/configs/assets/app_verctors.dart';
import 'package:spotify_app/core/configs/theme/text_styles.dart';
import 'package:spotify_app/core/helpers/spacing.dart';
import 'package:spotify_app/core/utils/app_strings.dart';
import 'package:spotify_app/common/widgets/basic_app_bar.dart';
import 'package:spotify_app/features/auth/presentation/widgets/register_or_signin_buttons.dart';
import '../../../../core/configs/assets/app_images.dart';

class SiginupOrSigninBody extends StatelessWidget {
  const SiginupOrSigninBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BasicAppBar(),
        // Top Pattern
        Align(
          alignment: Alignment.topRight,
          child: SvgPicture.asset(
            AppVerctors.topPattern,
          ),
        ),
        // Bottom Pattern
        Align(
          alignment: Alignment.bottomRight,
          child: SvgPicture.asset(
            AppVerctors.bottomPattern,
          ),
        ),

        // Auth Background
        Align(
          alignment: Alignment.bottomLeft,
          child: Image.asset(
            AppImages.authBg,
            height: 400.h,
          ),
        ),
        // body
        Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  AppVerctors.logo,
                ),
                verticalSpace(55),
                // Title
                Text(
                  AppStrings.enjoyListenToMusic,
                  style: TextStyles.font20bold,
                ),
                verticalSpace(20),
                // Subtitle
                Text(
                 AppStrings.spotifyDescription,
                  textAlign: TextAlign.center,
                  style: TextStyles.font15GreyRegular,
                ),
                verticalSpace(20),
                const RegisterOrSignInButtons(),
                verticalSpace(100),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

