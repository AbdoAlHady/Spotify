import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotify_app/core/extension/extension.dart';
import 'package:spotify_app/core/helpers/spacing.dart';
import 'package:spotify_app/core/routing/routes.dart';
import 'package:spotify_app/core/utils/app_strings.dart';
import 'package:spotify_app/core/widgets/app_elevated_button.dart';

import '../../../../../core/widgets/app_text_form_field.dart';
import '../have_or_daont_have_an_account.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({super.key});

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
                AppStrings.register,
                style: TextStyle(fontSize: 30.h, fontWeight: FontWeight.bold),
              ),
            ),

            verticalSpace(50),
            // Full Name
            const AppTextFormField(hint: AppStrings.fullName),
            verticalSpace(16),

            // Email
            const AppTextFormField(hint: AppStrings.email),
            verticalSpace(16),

            // Password
            const AppTextFormField(
              hint: AppStrings.password,
              suffixIcon: Icon(Icons.visibility_off),
            ),
            verticalSpace(33),

            // Create Account Button,
            AppElevatedButton(onPressed: () {}, title: AppStrings.creatAccount),

            // Have an account,
            verticalSpace(20),
            HaveOrDontHaveAnAccount(
              text1: AppStrings.haveAnAccount,
              text2: AppStrings.signIn,
              onTap: () {
                context.pushReplacementNamed(Routes.signInScreen);
              },
            ),
          ],
        ),
      ),
    );
  }
}
