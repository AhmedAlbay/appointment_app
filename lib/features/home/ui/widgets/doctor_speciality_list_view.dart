import 'package:appointment_app/features/home/data/model/specializations_response_model.dart';
import 'package:appointment_app/features/home/ui/widgets/doctor_specialization_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorSpecialityListView extends StatelessWidget {
  const DoctorSpecialityListView({super.key, required this.specializationData});
  final List<SpecializationData> specializationData;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h, // تحديد ارتفاع مناسب للحاوية الكلية
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: specializationData.length,
        itemBuilder: (context, index) {
          return DoctorSpecializationListViewItem(
            specializationData: specializationData[index],
            itemIndex: index,
          );
        },
      ),
    );
  }
}
