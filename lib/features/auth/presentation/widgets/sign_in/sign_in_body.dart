import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotify_app/core/extension/extension.dart';
import 'package:spotify_app/core/helpers/spacing.dart';
import 'package:spotify_app/core/helpers/validation_helper.dart';
import 'package:spotify_app/common/widgets/app_elevated_button.dart';
import 'package:spotify_app/common/widgets/app_text_form_field.dart';
import 'package:spotify_app/features/auth/presentation/cubit/signin/signin_cubit.dart';
import 'package:spotify_app/features/auth/presentation/widgets/have_or_daont_have_an_account.dart';

import '../../../../../core/routing/routes.dart';
import '../../../../../core/utils/app_strings.dart';

class SignInBody extends StatefulWidget {
  const SignInBody({super.key});

  @override
  State<SignInBody> createState() => _SignInBodyState();
}

class _SignInBodyState extends State<SignInBody> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 50.h, horizontal: 20.w),
        child: Form(
          key: _formKey,
          autovalidateMode: _autovalidateMode,
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
              AppTextFormField(
                hint: AppStrings.enterEmail,
                controller: _emailController,
                validator: (value) => ValidationHelper.validateEmail(value),
              ),
              verticalSpace(16),
              // Password
              AppTextFormField(
                hint: AppStrings.password,
                isPassword: _isObscure,
                controller: _passwordController,
                validator: (value) => ValidationHelper.validatePassword(value),
                suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    },
                    icon: Icon(
                        _isObscure ? Icons.visibility_off : Icons.visibility)),
              ),
              verticalSpace(33),
          
              // Sign In Button,
              AppElevatedButton(onPressed: () {
                if (_formKey.currentState!.validate()) {
                  context.read<SigninCubit>().signIn(email: _emailController.text.trim(), password: _passwordController.text.trim());
                }else{
                  setState(() {
                    _autovalidateMode = AutovalidateMode.always;
                  });
                }
              }, title: AppStrings.signIn),
          
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
      ),
    );
  }
}
