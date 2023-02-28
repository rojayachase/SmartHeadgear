//import 'package:anapact/_dummy_data_need_to_remove_global/res/res.dart';
import 'package:flutter/material.dart';
import 'package:anapact/core/constant/app_colors.dart';

class MyTextField extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;

  const MyTextField({
    key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.lightPrimaryColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.hintColor),
          ),
          fillColor: AppColors.lightPrimaryColor,
          filled: true,
          hintText: hintText,
          hintStyle: TextStyle(color: AppColors.hintColor),
        ),
      ),
    );
  }
}
