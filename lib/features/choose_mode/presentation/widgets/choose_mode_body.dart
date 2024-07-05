import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_app/core/configs/assets/app_images.dart';
import 'package:spotify_app/core/configs/assets/app_verctors.dart';
import 'package:spotify_app/core/configs/theme/text_styles.dart';
import 'package:spotify_app/core/helpers/spacing.dart';
import 'package:spotify_app/core/utils/app_strings.dart';
import 'package:spotify_app/core/widgets/app_elevated_button.dart';
import 'package:spotify_app/features/choose_mode/presentation/widgets/choose_mode_button.dart';

class ChooseModeBody extends StatelessWidget {
  const ChooseModeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 35.h, horizontal: 40.w),
      foregroundDecoration: BoxDecoration(
        color: Colors.black.withOpacity(0.15),
      ),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImages.chooeseModelBg),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        children: [
          // Sptify Logo,
          Align(
            alignment: Alignment.topCenter,
            child: SvgPicture.asset(
              AppVerctors.logo,
            ),
          ),

          const Spacer(),
          // Choose Mode Text
          Text(
            AppStrings.chooseMode,
            style: TextStyles.font22WhiteBold,
          ),
          verticalSpace(20),

          // Buttons 
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ChooseModeButton(
                imagePath: AppVerctors.darkMode,
                title: 'Dark Mode',
              ),
              ChooseModeButton(
                imagePath: AppVerctors.lightMode,
                title: 'Light Mode',
              ),
            ],
          ),
          verticalSpace(60),
          AppElevatedButton(onPressed: (){}, title: AppStrings.continueWord),


        ],
      ),
    );
  }
}
