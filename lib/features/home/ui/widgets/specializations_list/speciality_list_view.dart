import 'package:appointment_app/features/home/data/model/specializations_response_model.dart';
import 'package:appointment_app/features/home/logic/home_cubit.dart';
import 'package:appointment_app/features/home/ui/widgets/specializations_list/specialization_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpecialityListView extends StatefulWidget {
  const SpecialityListView({super.key, required this.specializationData});
  final List<SpecializationData?> specializationData;

  @override
  State<SpecialityListView> createState() => _SpecialityListViewState();
}

class _SpecialityListViewState extends State<SpecialityListView> {
   int selectIndex =0 ;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h, // تحديد ارتفاع مناسب للحاوية الكلية
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.specializationData.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectIndex = index;

              });
            context.read<HomeCubit>().getDoctorList(specializationId: widget.specializationData[index]?.id) ;
            },
            child: SpecializationListViewItem(
              specializationData: widget.specializationData[index]!,
              itemIndex: index,
              selectIndex: selectIndex,
            ),
          );
        },
      ),
    );
  }
}
