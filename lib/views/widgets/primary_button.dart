import 'package:anapact/core/constant/app_colors.dart';
import 'package:anapact/core/constant/app_font_family.dart';
import 'package:anapact/core/constant/app_sizes.dart';
import 'package:anapact/core/utils/screen_util.dart';
import 'package:anapact/views/widgets/sized_boxes.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String label;
  final double? fontSize;
  final double? height;
  final double? width;
  final Color color;
  final double? borderRadius;
  final VoidCallback? onPressed;
  final EdgeInsetsGeometry padding;
  final bool outlined;
  final Color? textColor;
  final Color? borderColor;
  final FontWeight? fontWeight;

  const PrimaryButton({
    Key? key,
    required this.label,
    this.width,
    this.fontSize,
    this.height,
    this.borderRadius,
    this.color = AppColors.accentColor,
    this.padding = const EdgeInsets.symmetric(horizontal: 10),
    required this.onPressed,
    this.borderColor,
    this.textColor,
    this.fontWeight,
  })  : outlined = false,
        super(key: key);

  const PrimaryButton.outlined({
    Key? key,
    required this.label,
    this.width,
    this.fontSize,
    this.height,
    this.borderRadius,
    this.borderColor,
    this.color = AppColors.accentColor,
    this.padding = const EdgeInsets.symmetric(horizontal: 10),
    required this.onPressed,
    this.textColor,
    this.fontWeight,
  })  : outlined = true,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    Color textColor =
        outlined ? (this.textColor ?? color) : this.textColor ?? Colors.white;
    Color backgroundColor = outlined ? Colors.transparent : color;
    return MaterialButton(
      textColor: onPressed != null ? textColor : textColor.withOpacity(0.5),
      color: backgroundColor,
      elevation: 0,
      padding: padding,
      height: height ?? ScreenUtil().setHeight(45),
      minWidth: width ?? ScreenUtil().screenWidth,
      highlightElevation: 0,
      disabledElevation: 0,
      splashColor: textColor.withOpacity(0.1),
      highlightColor: textColor.withOpacity(0.1),
      disabledColor: backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          borderRadius ?? Sizes.s4.h,
        ),
        side: BorderSide(color: borderColor ?? color, width: Sizes.s2.h),
      ),
      onPressed: onPressed != null
          ? () {
              FocusScope.of(context).requestFocus(FocusNode());
              onPressed?.call();
            }
          : null,
      child: FittedBox(
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: fontSize?.sp ?? Sizes.s16.sp,
            fontWeight: fontWeight ?? FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

class PrimaryTextButton extends StatelessWidget {
  final String label;
  final Widget? icon;
  final Color color;
  final double? fontSize;
  final VoidCallback? onPressed;
  final FontWeight? fontWeight;
  final TextDecoration? decoration;

  const PrimaryTextButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.fontSize,
    this.fontWeight,
    this.decoration,
    this.color = AppColors.accentColor,
  })  : icon = null,
        super(key: key);

  const PrimaryTextButton.icon({
    Key? key,
    required this.label,
    required this.icon,
    this.fontSize,
    this.fontWeight,
    this.decoration,
    this.color = AppColors.accentColor,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        foregroundColor: color,
        elevation: 0,
        textStyle: TextStyle(
          fontFamily: AppFontFamily.openSans,
          fontSize: fontSize ?? Sizes.s16.sp,
          fontWeight: fontWeight ?? FontWeight.w600,
          decoration: decoration ?? TextDecoration.none,
        ),
        padding: EdgeInsets.symmetric(horizontal: Sizes.s4.h),
      ),
      onPressed: onPressed,
      child: icon == null
          ? Text(label)
          : Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon ?? const SizedBox.shrink(),
                SizedBoxW10(),
                Text(label),
              ],
            ),
    );
  }
}
