import 'package:appointment_app/core/theming/font_weight.dart';
import 'package:appointment_app/core/theming/text_styles.dart';
import 'package:flutter/material.dart';

class DoctorSpecialityText extends StatelessWidget {
  const DoctorSpecialityText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Doctor Speciality",
          style: TextStyles.font18DarkBlueBold.copyWith(
            fontWeight: FontWeightHelper.semiBold,
          ),
        ),
        Spacer(),
          Text(
          "See All",
          style: TextStyles.font12MainBlueRegular
        ),
      ],
    );
  }
}
