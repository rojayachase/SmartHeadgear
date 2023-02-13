import 'package:anapact/core/constant/app_colors.dart';
import 'package:anapact/core/constant/app_sizes.dart';
import 'package:anapact/views/widgets/sized_boxes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PrimaryTextField extends FormField<String> {
  final String hintText;
  final bool readOnly;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final List<TextInputFormatter>? inputFormatters;
  final VoidCallback? onTap;
  final String? labelText;
  final bool? isMandatory;

  PrimaryTextField({
    Key? key,
    required this.hintText,
    required this.controller,
    this.labelText,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.suffixIcon,
    this.inputFormatters,
    this.readOnly = false,
    this.onTap,
    this.prefixIcon,
    this.isMandatory = false,
    AutovalidateMode autovalidateMode = AutovalidateMode.onUserInteraction,
    FormFieldValidator<String>? validator,
    ValueChanged<String>? onChanged,
  }) : super(
            key: key,
            initialValue: controller.text,
            validator: validator,
            autovalidateMode: autovalidateMode,
            builder: (FormFieldState<String> field) {
              void onChangedHandler(String value) {
                field.didChange(value);
                if (onChanged != null) {
                  onChanged(value);
                }
              }

              BoxBorder setBorder() {
                Color borderColor = (!field.isValid && field.errorText == null)
                    ? AppColors.borderColor
                    : field.isValid
                        ? AppColors.borderColor
                        : AppColors.accentColor;
                return Border.all(width: 0.8, color: borderColor);
              }

              return UnmanagedRestorationScope(
                bucket: field.bucket,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (labelText != null) ...[
                      Row(
                        children: [
                          Text(
                            labelText,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: Sizes.s16.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          if (isMandatory == true)
                            Text(
                              '*',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: AppColors.errorColor,
                                fontSize: Sizes.s16.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                        ],
                      ),
                      SizedBoxH10(),
                    ],
                    Container(
                      padding: suffixIcon != null
                          ? const EdgeInsets.only(left: 12, top: 2, bottom: 2)
                          : prefixIcon != null
                              ? const EdgeInsets.only(
                                  left: 0, top: 2, bottom: 2)
                              : const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: setBorder(),
                      ),
                      child: TextField(
                        autocorrect: false,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: Sizes.s16.sp,
                          fontWeight: FontWeight.w400,
                        ),
                        onTap: onTap,
                        controller: controller,
                        keyboardType: keyboardType,
                        onChanged: onChangedHandler,
                        readOnly: readOnly,
                        cursorColor: AppColors.accentColor,
                        obscureText: obscureText,
                        inputFormatters: inputFormatters,
                        decoration: InputDecoration(
                          hintText: hintText,
                          border: InputBorder.none,
                          suffixIcon: suffixIcon,
                          prefixIcon: prefixIcon,
                        ),
                      ),
                    ),
                    if (!field.isValid && field.errorText != null)
                      Visibility(
                        visible: !field.isValid,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 7, left: 3),
                          child: Text(
                            field.errorText ?? '',
                            style: TextStyle(
                              fontSize: Sizes.s12.sp,
                              color: AppColors.accentColor,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              );
            });
}
