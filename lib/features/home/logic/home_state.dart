import 'package:appointment_app/core/networking/api_error_handler.dart';
import 'package:appointment_app/features/home/data/model/specializations_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';

@Freezed()
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;

  // Specializations 
  const factory HomeState.specializationsLoading() = SpecializationsLoading;
  const factory HomeState.specializationsSuccess(
    List<SpecializationData?>? specializationData,
  ) = SpecializationsSuccess;
  const factory HomeState.specializationsError(ErrorHandler errorHandler) =
      SpecializationsError;

   // Doctors
        const factory HomeState.doctorSuccess(List <Doctors?>? doctorsList) = DoctorSuccess;
         const factory HomeState.doctorError(ErrorHandler errorHandler) =DoctorError;


}
