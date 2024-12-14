import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_app/core/configs/assets/app_images.dart';
import 'package:spotify_app/core/configs/assets/app_verctors.dart';
import 'package:spotify_app/core/configs/theme/text_styles.dart';
import 'package:spotify_app/core/extension/extension.dart';
import 'package:spotify_app/core/helpers/spacing.dart';
import 'package:spotify_app/core/routing/routes.dart';
import 'package:spotify_app/core/utils/app_strings.dart';
import 'package:spotify_app/common/widgets/app_elevated_button.dart';

class IntroBody extends StatelessWidget {
  const IntroBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          // OnBoarding Background Image
          Container(
            padding: EdgeInsets.symmetric(vertical: 40.h, horizontal: 40.w),
            // Shadow
            foregroundDecoration: BoxDecoration(
              color: Colors.black.withOpacity(0.15),
            ),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.onBoardingBg1),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(
              children: [
                // Sptify Logo,
                Align(
                    alignment: Alignment.topCenter,
                    child: SvgPicture.asset(AppVerctors.logo)),
                const Spacer(),
                // Title,
                Text(
                  AppStrings.introTitle,
                  style: TextStyles.font18WhiteBold,
                ),
                verticalSpace(21),

                // Subtitle
                Text(
                  AppStrings.introSubTitle,
                  style: TextStyles.font13GreyRegular,
                  textAlign: TextAlign.center,
                ),
                verticalSpace(58),

                // Get Started Button
                AppElevatedButton(
                    onPressed: () {
                      context.pushNamed(Routes.chooseModeScreen);
                    },
                    title: AppStrings.getStarted),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
