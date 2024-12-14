import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:spotify_app/core/configs/theme/text_styles.dart';

class HaveOrDontHaveAnAccount extends StatelessWidget {
  const HaveOrDontHaveAnAccount(
      {super.key, required this.text1, required this.text2, required this.onTap});
  final String text1;
  final String text2;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: text1,
            style: TextStyles.font14Meduim,
          ),
          TextSpan(
            text: text2,
            style: TextStyles.font15blueBold,
            recognizer: TapGestureRecognizer()..onTap = onTap,
          ),
        ],
      ),
    );
  }
}
