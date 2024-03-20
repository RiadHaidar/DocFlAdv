import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutteradvnced/core/theming/colors.dart';
import 'package:flutteradvnced/core/theming/styles.dart';

class AppTextFromField extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final String hintText;
  final bool? isObscureText;
  final Widget? suffixIcon;
  final Color? backgroundColor;
  const AppTextFromField(
      {super.key,
      this.contentPadding,
      this.focusedBorder,
      this.enabledBorder,
      this.inputTextStyle,
      this.hintStyle,
      this.suffixIcon,
      required this.hintText,
      this.isObscureText,
      this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        filled: true,
          fillColor: backgroundColor ?? ColorsManager.moreLightGray,
          isDense: true,
          contentPadding: contentPadding ??
              EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
          enabledBorder: enabledBorder ??
              OutlineInputBorder(
                borderSide: const BorderSide(
                    color: ColorsManager.lighterGray, width: 1.3),
                borderRadius: BorderRadius.circular(16),
              ),
          focusedBorder: focusedBorder ??
              OutlineInputBorder(
                borderSide:
                    const BorderSide(color: ColorsManager.mainBlue, width: 1.3),
                borderRadius: BorderRadius.circular(16),
              ),
          hintStyle: hintStyle ?? TextStyles.font14LightGrayRegular,
          helperText: hintText,
          suffixIcon: suffixIcon),
      obscureText: isObscureText ?? false,
      style: TextStyles.font14DarkBlueMedium,
    );
  }
}
