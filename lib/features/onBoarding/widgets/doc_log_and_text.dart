import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/theming/text_styles.dart';
class DocLogAndText extends StatelessWidget {
  const DocLogAndText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
   
       SvgPicture.asset("assets/svgs/doc_log.svg") ,
       SizedBox(width: 10.h,),
       Text("Docdoc"  ,style: TextStyles.font24BlackBold,),
      ],
    );
  }
}