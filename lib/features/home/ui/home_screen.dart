import 'package:appointment_app/features/home/ui/widgets/doctor_speciality_text.dart';
import 'package:appointment_app/features/home/ui/widgets/doctor_list/doctors_bloc_builder.dart';
import 'package:appointment_app/features/home/ui/widgets/specializations_list/specialization_bloc_builder.dart';
import 'package:appointment_app/features/home/ui/widgets/home_blue_container.dart';
import 'package:appointment_app/features/home/ui/widgets/home_top_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 28.h),
          width: double.infinity,
          color: Colors.white,
          child: Column(
            children: [
              HomeTopBar(),
              SizedBox(height: 16.h),
              HomeBlueContainer(),
              SizedBox(height: 24.h),
              DoctorSpecialityText(),
              SizedBox(height: 16.h),
              SpecializationBlocBuilder(),
              SizedBox(height: 16.h),
              DoctorsBlocBuilder(),
            ],
          ),
        ),
      ),
    );
  }
}

