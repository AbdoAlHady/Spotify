import 'package:flutter/material.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    super.key,
    required this.hint,
    this.controller,
    this.suffixIcon, this.validator,
  });
  final String hint;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      controller: controller,
      validator:validator ,
      decoration: InputDecoration(
        hintText: hint,
        suffixIcon: suffixIcon,
      ).applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }
}
