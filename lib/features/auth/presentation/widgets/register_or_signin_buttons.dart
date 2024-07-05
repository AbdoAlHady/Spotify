import 'package:flutter/material.dart';
import 'package:spotify_app/core/configs/theme/text_styles.dart';
import 'package:spotify_app/core/extension/extension.dart';
import 'package:spotify_app/core/helpers/spacing.dart';
import 'package:spotify_app/core/widgets/app_elevated_button.dart';

class RegisterOrSignInButtons extends StatelessWidget {
  const RegisterOrSignInButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Register Button
        Expanded(
          child: AppElevatedButton(
              onPressed: () {}, title: 'Register'),
        ),
        horizontalSpace(20),
    
        // SignIn Button
        Expanded(
          child: TextButton(
            onPressed: () {},
            child: Text(
              'Sign In',
              style: TextStyles.font19WhiteMeduim.copyWith(
                color: context.isDarkMode
                    ? Colors.white
                    : Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
