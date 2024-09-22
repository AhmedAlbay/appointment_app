import 'package:appointment_app/core/theming/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextStyles {
  static TextStyle font24Black700Weight = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.w700,
    color: Colors.black,
  );

  static TextStyle font32BoldBlue =TextStyle(
    fontSize: 32.sp ,
    fontWeight: FontWeight.bold,
    color: ColorManager.mainColor ,
  );
    static TextStyle font13grey400Weight =TextStyle(
    fontSize: 13.sp ,
    fontWeight: FontWeight.w400,
    color: ColorManager.grey ,
  );
   static TextStyle font24White600Weight =TextStyle(
    fontSize: 24.sp ,
    fontWeight: FontWeight.w600,
    color: Colors.white ,
  );
}
