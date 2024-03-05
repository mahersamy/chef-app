import 'package:chef_app/core/utlis/app_colors.dart';
import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {
  const CustomField(
      {super.key,
      this.isPassword = false,
      required this.hintText,
      required this.controller,
      this.icon,
      this.suffixIconOnPressed,
      this.validation});

  final bool isPassword;
  final String hintText;
  final TextEditingController controller;
  final IconData? icon;
  final VoidCallback? suffixIconOnPressed;
  final String? Function(String? value)? validation;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isPassword,
      validator: validation,
      controller: controller,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          icon: Icon(icon,color: AppColors.black,),
          onPressed: suffixIconOnPressed,
        ),
        hintText: hintText,
        enabledBorder: Theme.of(context).inputDecorationTheme.enabledBorder,
        focusedBorder: Theme.of(context).inputDecorationTheme.focusedBorder,
        errorBorder: Theme.of(context).inputDecorationTheme.errorBorder,
        hintStyle: Theme.of(context).inputDecorationTheme.hintStyle,
      ),
    );
  }
}
