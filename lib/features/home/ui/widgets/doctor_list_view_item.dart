import 'package:appointment_app/core/theming/text_styles.dart';
import 'package:appointment_app/features/home/data/model/specializations_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorListViewItem extends StatelessWidget {
  const DoctorListViewItem({super.key, required this.doctorModel});
  
  final Doctors doctorModel;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16.r),
            child: Image.network(
              width: 118.w,
              height: 120.h,
              "https://pbs.twimg.com/profile_images/1526943595743305729/f3GAlT6Y_400x400.jpg",
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: 18.w,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  doctorModel.name ?? "Ahmed",
                  style: TextStyles.font18DarkBlueBold,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1, // Ensures text doesn't overflow
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  "${doctorModel.gender} | ${doctorModel.degree}",
                  style: TextStyles.font12greyMedium,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  doctorModel.email ?? "Email",
                  style: TextStyles.font12greyMedium,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                SizedBox(
                  height: 5.h,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
