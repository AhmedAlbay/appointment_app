import 'package:appointment_app/features/home/data/model/specializations_response_model.dart';
import 'package:appointment_app/features/home/ui/widgets/doctor_list/doctor_list_view_item.dart';
import 'package:flutter/material.dart';

class DoctorListView extends StatelessWidget {
  const DoctorListView({super.key, required this.doctors});
  final List<Doctors?> doctors;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: doctors.length,
        itemBuilder: (context, index) {
          return DoctorListViewItem(doctorModel: doctors[index]!);
        },
      ),
    );
  }
}
