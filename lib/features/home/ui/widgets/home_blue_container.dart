import 'package:appointment_app/core/theming/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeBlueContainer extends StatelessWidget {
  const HomeBlueContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 195.h, // ارتفاع الحاوية العامة
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: 170.h, // ارتفاع الحاوية الزرقاء
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(36.r),
              image: DecorationImage(
                image: AssetImage("assets/images/homebluecontainer.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Book and\nschedule with\nnearest doctor",
                      style: TextStyles.font18WhiteMedium,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Expanded(
                      child: ElevatedButton(
                        style: ButtonStyle(
                          shape: WidgetStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24.r),
                            ),
                          ),
                          backgroundColor: WidgetStatePropertyAll(Colors.white),
                        ),
                        onPressed: () {},
                        child: Text(
                          "Find Nearby",
                          style: TextStyles.font12MainBlueRegular,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // تعديل موضع صورة الطبيب ليكون فوق الـ Container
          Positioned(
            right: 8.w,
            top: 0, // تحريك الصورة للأعلى ليتجاوز رأس الطبيب الحاوية الزرقاء
            child: Image.asset(
              "assets/images/doctor.png",
              height: 200.h, // يمكنك تعديل الحجم حسب الحاجة
             
            ),
          ),
        ],
      ),
    );
  }
}
