import 'package:appointment_app/features/home/logic/home_cubit.dart';
import 'package:appointment_app/features/home/logic/home_state.dart';
import 'package:appointment_app/features/home/ui/widgets/doctor_list/doctor_shimmer_loading.dart';
import 'package:appointment_app/features/home/ui/widgets/specializations_list/speciality_list_view.dart';
import 'package:appointment_app/features/home/ui/widgets/specializations_list/specialization_shimmer_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpecializationBlocBuilder extends StatelessWidget {
  const SpecializationBlocBuilder({
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
            return setupLoading();
          },
          specializationsSuccess: (specializationData) {
            var specializationDataList = specializationData ?? [];
            return setupSuccess(specializationDataList);
          },
          specializationsError: (errorhandler) {
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
    return Expanded(
      child: Column(
        children: [
          const SpecialityShimmerLoading(),
          SizedBox(height: 8 .h,),
          const DoctorsShimmerLoading(),
        ],
      ),
    );
  }

  Widget setupSuccess(specializationDataList) {
    return SpecialityListView(
        specializationData: specializationDataList ?? []);
  }

  Widget setupError() {
    return SizedBox.shrink();
  }
}
