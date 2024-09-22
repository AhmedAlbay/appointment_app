import 'package:appointment_app/core/theming/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/doc_image_and_text.dart';
import 'widgets/doc_log_and_text.dart';
import 'widgets/get_started_button.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(top: 25.h, bottom: 25.h),
        child: Column(
          children: [
            const DocLogAndText(),
            SizedBox(height: 25.h),
            const DocImageAndText(),
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 30.w),
              child: Column(
              
                children: [
                  Text(
                    "Manage and schedule all of your medical appointments easily with Docdoc to get a new experience.",
                    style: TextStyles.font13grey400Weight,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                  ),
                  SizedBox(height: 25.h,),
                  const GetStartedButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    )));
  }
}
