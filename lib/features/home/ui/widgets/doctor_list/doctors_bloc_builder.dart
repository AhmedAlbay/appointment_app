import 'package:appointment_app/core/theming/color.dart';
import 'package:appointment_app/features/home/logic/home_cubit.dart';
import 'package:appointment_app/features/home/logic/home_state.dart';
import 'package:appointment_app/features/home/ui/widgets/doctor_list/doctor_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorsBlocBuilder extends StatelessWidget {
  const DoctorsBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is DoctorSuccess || current is DoctorError,
      builder: (context, state) {
        return state.maybeWhen(
          doctorSuccess: (doctorsList) {
            var doctorList = doctorsList ?? [];
            return setupSuccess(doctorList);
          },
          doctorError: (errorhandler) {
            return setupError(); // You can show an error message here if needed
          },
          orElse: () {
            return SizedBox
                .shrink(); // Ensures the method always returns a widget
          },
        );
      },
    );
  }

  Widget setupLoading() {
    return SizedBox(
      height: 100.h,
      child: Center(
        child: CircularProgressIndicator(
          color: ColorManager.mainColor,
        ),
      ),
    );
  }

  Widget setupSuccess(doctors) {
    return DoctorListView(doctors: doctors ?? []);
  }

  Widget setupError() {
    return SizedBox.shrink();
  }
}
