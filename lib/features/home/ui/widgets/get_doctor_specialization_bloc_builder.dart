import 'package:appointment_app/core/theming/color.dart';
import 'package:appointment_app/features/home/logic/home_cubit.dart';
import 'package:appointment_app/features/home/logic/home_state.dart';
import 'package:appointment_app/features/home/ui/widgets/doctor_list_view.dart';
import 'package:appointment_app/features/home/ui/widgets/doctor_speciality_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GetDoctorSpecializationBlocBuilder extends StatelessWidget {
  const GetDoctorSpecializationBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is SpecializationsLoading ||
          current is SpecializationsSuccess ||
          current is SpecializationsError,
      builder: (context, state) {
        return state.maybeWhen(
          specializationsLoading: () {
            return SizedBox(
              height: 100.h,
              child: Center(
                child: CircularProgressIndicator(
                  color: ColorManager.mainColor,
                ),
              ),
            );
          },
          specializationsSuccess: (specializationsResponseModel) {
            var specializationDataList =
                specializationsResponseModel.specializationData;
            return Expanded(
              child: Column(
                children: [
                  DoctorSpecialityListView(
                    specializationData: specializationDataList ?? [],
                  ),
                  SizedBox(height: 22.h),
                  DoctorListView(
                    doctors:
                        specializationDataList![0].doctorsList ?? [],
                  ),
                ],
              ),
            );
          },
          specializationsError: (errorhandler) {
            return SizedBox
                .shrink(); // You can show an error message here if needed
          },
          orElse: () {
            return SizedBox
                .shrink(); // Ensures the method always returns a widget
          },
        );
      },
    );
  }
}
