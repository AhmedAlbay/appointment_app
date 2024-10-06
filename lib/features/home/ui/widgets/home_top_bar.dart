import 'package:appointment_app/core/theming/color.dart';
import 'package:appointment_app/core/theming/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeTopBar extends StatelessWidget {
  const HomeTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hi, Omar!",
              style: TextStyles.font18DarkBlueBold,
            ),
            Text(
              "How Are you Today?",
              style: TextStyles.font12greyRegular.copyWith(
                color: ColorManager.greyWhite,
              ),
            ),
          ],
        ),
        Spacer(),
        CircleAvatar(
          radius: 26,
          backgroundColor: ColorManager.greyblur,
          child: SvgPicture.asset("assets/svgs/notification.svg"),
        )
      ],
    );
  }
}
