import 'package:appointment_app/core/theming/color.dart';
import 'package:appointment_app/core/theming/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextFormFiled extends StatelessWidget {
  const AppTextFormFiled({
    super.key,
    this.enabledBorder,
    this.focusedBorder,
    this.suffixIcon,
    this.padding,
    required this.hintText,
    this.isObscureText,
    this.hintStyle,
    this.inputStyle,
  });
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final EdgeInsetsGeometry? padding;
  final Widget? suffixIcon;
  final String hintText;
  final bool? isObscureText;
  final TextStyle? hintStyle;
  final TextStyle? inputStyle;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isObscureText ?? false,
      decoration: InputDecoration(
        filled: true,
        fillColor: ColorManager.backGrounTextFieldColor,
        isDense: true,
        contentPadding:
            padding ?? EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        enabledBorder: enabledBorder ??
            OutlineInputBorder(
              borderSide:
                  BorderSide(color: ColorManager.lighterGray, width: 1.2.w),
              borderRadius: BorderRadius.circular(16.r),
            ),
        focusedBorder: focusedBorder ??
            OutlineInputBorder(
              borderSide:
                  BorderSide(color: ColorManager.mainColor, width: 1.2.w),
              borderRadius: BorderRadius.circular(16.r),
            ),
        hintText: hintText,
        hintStyle: hintStyle ??
            TextStyles.font14greyMedium.copyWith(
              color: ColorManager.lightGray,
            ),
        suffixIcon: suffixIcon,
        suffixIconColor: ColorManager.mainColor,
      ),
      style: inputStyle ?? TextStyles.font14greyMedium,
    );
  }
}
