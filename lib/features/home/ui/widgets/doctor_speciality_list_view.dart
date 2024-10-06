import 'package:appointment_app/core/theming/color.dart';
import 'package:appointment_app/core/theming/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DoctorSpecialityListView extends StatelessWidget {
  const DoctorSpecialityListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h, // تحديد ارتفاع مناسب للحاوية الكلية
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 8,
        
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsetsDirectional.only(
              start: index == 0 ? 0 : 25.w,
            ),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundColor: ColorManager.greyblur,
                  child: SvgPicture.asset(
                    "assets/svgs/notification.svg",
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  "General",
                  style: TextStyles.font12greyRegular,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
