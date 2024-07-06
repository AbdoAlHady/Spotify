import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotify_app/core/extension/extension.dart';
import 'package:spotify_app/core/helpers/spacing.dart';
import 'package:spotify_app/core/widgets/app_elevated_button.dart';
import 'package:spotify_app/core/widgets/app_text_form_field.dart';
import 'package:spotify_app/features/auth/presentation/widgets/have_or_daont_have_an_account.dart';

import '../../../../../core/routing/routes.dart';
import '../../../../../core/utils/app_strings.dart';

class SignInBody extends StatelessWidget {
  const SignInBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 50.h, horizontal: 20.w),
        child: Column(
          children: [
            // Sign Up Title
            Center(
              child: Text(
                AppStrings.signIn,
                style: TextStyle(fontSize: 30.h, fontWeight: FontWeight.bold),
              ),
            ),
            verticalSpace(50),

            // Email
            const AppTextFormField(hint: AppStrings.enterEmail),
            verticalSpace(16),
            // Password
            const AppTextFormField(
              hint: AppStrings.password,
              suffixIcon: Icon(Icons.visibility_off),
            ),
            verticalSpace(33),

            // Sign In Button,
            AppElevatedButton(onPressed: () {}, title: AppStrings.signIn),

            // Have an account,
            verticalSpace(20),
            HaveOrDontHaveAnAccount(
              text1: AppStrings.notMember,
              text2: AppStrings.register,
              onTap: () {
                context.pushReplacementNamed(Routes.signUpScreen);
              },
            ),
          ],
        ),
      ),
    );
  }
}