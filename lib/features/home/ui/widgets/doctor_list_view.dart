import 'package:appointment_app/core/theming/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorListView extends StatelessWidget {
  const DoctorListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
          shrinkWrap: true,
            itemCount: 8,
            itemBuilder: (context, index) {
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
                      width: 16.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Dr. John Doe",
                          style: TextStyles.font18DarkBlueBold,
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                          "General | RSUD Gatot Subroto",
                          style: TextStyles.font12greyMedium,
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                          "afdshg@gmail.com",
                          style: TextStyles.font12greyMedium,
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                      ],
                    )
                  ],
                ),
              );
            }));
  }
}
