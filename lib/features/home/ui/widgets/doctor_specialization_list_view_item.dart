import 'package:appointment_app/core/theming/color.dart';
import 'package:appointment_app/core/theming/text_styles.dart';
import 'package:appointment_app/features/home/data/model/specializations_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class DoctorSpecializationListViewItem extends StatelessWidget {
  const DoctorSpecializationListViewItem({super.key, required this.specializationData, required this.itemIndex});
final SpecializationData  specializationData;
final int itemIndex ;

  @override
  Widget build(BuildContext context) {
     return Padding(
            padding: EdgeInsetsDirectional.only(
              start: itemIndex == 0 ? 0 : 25.w,
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
                  specializationData.name ?? "Doctor",
                  style: TextStyles.font12greyRegular,
                ),
              ],
            ),
          );
  }
}