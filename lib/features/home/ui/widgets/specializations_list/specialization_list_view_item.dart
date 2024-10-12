import 'package:appointment_app/core/theming/color.dart';
import 'package:appointment_app/core/theming/text_styles.dart';
import 'package:appointment_app/features/home/data/model/specializations_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SpecializationListViewItem extends StatelessWidget {
  const SpecializationListViewItem({super.key, required this.specializationData, required this.itemIndex, required this.selectIndex});
final SpecializationData  specializationData;
final int itemIndex ;
final int selectIndex ;
  @override
  Widget build(BuildContext context) {
     return Padding(
            padding: EdgeInsetsDirectional.only(
              start: itemIndex == 0 ? 0 : 25.w,
            ),
            child: Column(
              children: [
            itemIndex ==selectIndex ?
             Container(
              decoration: BoxDecoration(
                border: Border.all(  color:   ColorManager.darkBlue) ,
                shape: BoxShape.circle ,
              ),
              child: CircleAvatar(
                 radius: 24,
                  backgroundColor: ColorManager.greyblur,
                  child: SvgPicture.asset(
                    "assets/svgs/notification.svg",
                    fit: BoxFit.cover,
                    height: 42.h,
                    width: 42.w,
                  ),
              ),
             )

            :    CircleAvatar(
                  radius: 24,
                  backgroundColor: ColorManager.greyblur,
                  child: SvgPicture.asset(
                      height: 40.h,
                    width: 42.h,
                    "assets/svgs/notification.svg",
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  specializationData.name ?? "Doctor",
                    style:
                    itemIndex == selectIndex ? TextStyles.font14DarkBlueBold :
                    
                     TextStyles.font12greyRegular,
                ),
              ],
            ),
          );
  }
}