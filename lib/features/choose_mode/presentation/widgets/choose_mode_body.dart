import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_app/core/configs/assets/app_images.dart';
import 'package:spotify_app/core/configs/assets/app_verctors.dart';
import 'package:spotify_app/core/configs/theme/text_styles.dart';
import 'package:spotify_app/core/extension/extension.dart';
import 'package:spotify_app/core/helpers/spacing.dart';
import 'package:spotify_app/core/routing/routes.dart';
import 'package:spotify_app/core/services/cache_helper.dart';
import 'package:spotify_app/core/utils/app_strings.dart';
import 'package:spotify_app/core/utils/shared_preferences_keys.dart';
import 'package:spotify_app/common/widgets/app_elevated_button.dart';
import 'package:spotify_app/features/choose_mode/presentation/bloc/theme_cubit.dart';
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
          color: Colors.white),
      child: Column(
        children: [
          // Sptify Logo
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ChooseModeButton(
                imagePath: AppVerctors.darkMode,
                title: 'Dark Mode',
                onPressed: () {
                  context.read<ThemeCubit>().updateMode(mode: ThemeMode.dark);
                },
              ),
              ChooseModeButton(
                imagePath: AppVerctors.lightMode,
                title: 'Light Mode',
                onPressed: () {
                  context.read<ThemeCubit>().updateMode(mode: ThemeMode.light);
                },
              ),
            ],
          ),
          verticalSpace(60),
          AppElevatedButton(
              onPressed: () async {
                await CacheHelper().saveData(
                    key: SharedPreferencesKeys.isFirstTime, value: true);
                if (!context.mounted) return;
                context.pushNamed(Routes.signupOrSigninScreen);
              },
              title: AppStrings.continueWord),
        ],
      ),
    );
  }
}
