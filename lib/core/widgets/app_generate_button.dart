import 'package:appointment_app/core/theming/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppGenerateButton extends StatelessWidget {
  const AppGenerateButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
    required this.buttonTextStyle,
    this.borderRadius,
    this.backgroundColor,
    this.verticalPadding,
    this.horizontalPadding,
    this.buttonWidth,
    this.buttonHeight,
  });
  final String buttonText;
  final VoidCallback onPressed;
  final TextStyle buttonTextStyle;
  final double? borderRadius;
  final Color? backgroundColor;
  final double? verticalPadding;
  final double? horizontalPadding;
  final double? buttonWidth;
  final double? buttonHeight;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: ButtonStyle(
            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  borderRadius ?? 16.r,
                ),
              ),
            ),
            fixedSize: WidgetStateProperty.all(
              Size(
                buttonWidth?.w ?? double.maxFinite,
                buttonHeight?.h ?? 52.h,
              ),
            ),
            backgroundColor: WidgetStatePropertyAll(
              backgroundColor ?? ColorManager.mainColor,
            ),
            padding: WidgetStateProperty.all<EdgeInsets>(EdgeInsets.symmetric(
              horizontal: horizontalPadding?.w ?? 12.w,
              vertical: verticalPadding?.h ?? 14.h,
            ))),
        onPressed: onPressed,
        child: Text(
          buttonText,
          style: buttonTextStyle,
        ));
  }
}
