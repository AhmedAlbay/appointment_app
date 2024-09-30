import 'package:appointment_app/core/theming/color.dart';
import 'package:appointment_app/core/theming/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PasswordValidation extends StatelessWidget {
  const PasswordValidation({
    super.key,
    required this.hasLowerCase,
    required this.hasUpperCase,
    required this.specialCharacters,
    required this.hasMinLength,
    required this.hasNumber,
  });
  final bool hasLowerCase;
  final bool hasUpperCase;
  final bool specialCharacters;
  final bool hasMinLength;
  final bool hasNumber;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildValidationRow("At least lowerCase letter", hasLowerCase),
        SizedBox(height: 2.h,),
            buildValidationRow("At least upper letter", hasUpperCase),
        SizedBox(height: 2.h,),
            buildValidationRow("At least number", hasNumber),
        SizedBox(height: 2.h,),
            buildValidationRow("At least special characters", specialCharacters),
        SizedBox(height: 2.h,),
            buildValidationRow("At least 8 characters long", hasMinLength),
        SizedBox(height: 2.h,),
      ],
    );
  }

  Widget buildValidationRow(String text, bool hasValidated) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: ColorManager.grey,
          radius: 2.5,
        ),
        SizedBox(
          width: 6.w,
        ),
        Text(text,
            style: TextStyles.font12DarkBlueRegular.copyWith(
              decoration: hasValidated ? TextDecoration.lineThrough : null,
              decorationColor: Colors.green,
              decorationThickness: 2,
              color: hasValidated ? ColorManager.grey : ColorManager.darkBlue,
            ))
      ],
    );
  }
}
