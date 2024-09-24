import 'package:appointment_app/core/theming/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'font_weight.dart';

class TextStyles {
  static TextStyle font24BlackBold= TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeightHelper.bold,
    color: Colors.black,
  );

  static TextStyle font32BoldBlue =TextStyle(
    fontSize: 32.sp ,
    fontWeight: FontWeightHelper.bold,
    color: ColorManager.mainColor ,
  );
    static TextStyle font13greyRegular =TextStyle(
    fontSize: 13.sp ,
    fontWeight: FontWeightHelper.regular,
    color: ColorManager.grey ,
  );
      static TextStyle font14greyRegular =TextStyle(
    fontSize: 14.sp ,
    fontWeight: FontWeightHelper.regular,
    color: ColorManager.grey ,
  );
   static TextStyle font14greyMedium =TextStyle(
    fontSize: 14.sp ,
    fontWeight: FontWeightHelper.regular,
    color: ColorManager.darkGray ,
  );
   static TextStyle font24WhiteSemiBold =TextStyle(
    fontSize: 24.sp ,
    fontWeight: FontWeightHelper.semiBold,
    color: Colors.white ,
  );
    static TextStyle font16WhiteSemiBold =TextStyle(
    fontSize: 16.sp ,
    fontWeight: FontWeightHelper.semiBold,
    color: Colors.white ,
  );
     static TextStyle font24BlueBold =TextStyle(
    fontSize: 24.sp ,
    fontWeight: FontWeightHelper.semiBold,
    color: ColorManager.mainColor ,
  );
  static TextStyle font12greyRegular =TextStyle(
    fontSize: 12.sp ,
    fontWeight: FontWeightHelper.regular,
    color: const Color(0xff9E9E9E) ,
  );
   static TextStyle font12DarkBlueRegular =TextStyle(
    fontSize: 12.sp ,
    fontWeight: FontWeightHelper.regular,
    color: ColorManager.darkGray,
  );
   static TextStyle font12MainBlueRegular =TextStyle(
    fontSize: 12.sp ,
    fontWeight: FontWeightHelper.regular,
    color: ColorManager.mainColor,
  );
}
