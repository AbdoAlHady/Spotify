import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotify_app/core/extension/extension.dart';
import 'package:spotify_app/core/helpers/spacing.dart';
import 'package:spotify_app/core/helpers/validation_helper.dart';
import 'package:spotify_app/core/routing/routes.dart';
import 'package:spotify_app/core/utils/app_strings.dart';
import 'package:spotify_app/core/widgets/app_elevated_button.dart';
import 'package:spotify_app/features/auth/presentation/cubit/signup_cubit/signup_cubit.dart';

import '../../../../../core/widgets/app_text_form_field.dart';
import '../have_or_daont_have_an_account.dart';

class SignUpBody extends StatefulWidget {
  const SignUpBody({super.key});

  @override
  State<SignUpBody> createState() => _SignUpBodyState();
}

class _SignUpBodyState extends State<SignUpBody> {
  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  bool isObscureText = true;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 50.h, horizontal: 20.w),
        child: Form(
          key: _formKey,
           autovalidateMode: autovalidateMode,
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
              AppTextFormField(
                hint: AppStrings.fullName,
                controller: _fullNameController,
                validator: (value) =>
                    ValidationHelper.validateEmptyText('Full name', value),
              ),
              verticalSpace(16),

              // Email
              AppTextFormField(
                hint: AppStrings.email,
                controller: _emailController,
                validator: (value) => ValidationHelper.validateEmail(value),
              ),
              verticalSpace(16),

              // Password
              AppTextFormField(
                hint: AppStrings.password,
                isPassword: isObscureText,
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      isObscureText = !isObscureText;
                    });
                  },
                  icon: Icon(
                      isObscureText ? Icons.visibility : Icons.visibility_off),
                ),
                controller: _passwordController,
                validator: (value) => ValidationHelper.validatePassword(value),
              ),
              verticalSpace(33),

              // Create Account Button,
              AppElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      context.read<SignupCubit>().signup(
                            email: _emailController.text.trim(),
                            password: _passwordController.text.trim(),
                            fullName: _fullNameController.text.trim(),
                          );
                    } else {
                      setState(() {
                        autovalidateMode = AutovalidateMode.always;
                      });
                    }
                  },
                  title: AppStrings.creatAccount),

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
      ),
    );
  }
}
