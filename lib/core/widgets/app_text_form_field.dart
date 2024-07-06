import 'package:flutter/material.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    super.key,
    required this.hint,
    this.controller,
    this.suffixIcon,
  });
  final String hint;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        suffixIcon: suffixIcon,
      ).applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }
}
