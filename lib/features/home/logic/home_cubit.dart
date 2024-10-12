import 'package:appointment_app/core/helpers/extensions.dart';
import 'package:appointment_app/core/networking/api_error_handler.dart';
import 'package:appointment_app/features/home/data/model/specializations_response_model.dart';
import 'package:appointment_app/features/home/data/repo/home_repo.dart';
import 'package:appointment_app/features/home/logic/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;
  HomeCubit(this._homeRepo) : super(HomeState.initial());

  List<SpecializationData?>? specializationData = [];

  void getSpecializations() async {
    emit(HomeState.specializationsLoading());
    final response = await _homeRepo.getSpecializations();
    response.when(
      success: (specialization) {
        specializationData = specialization.specializationData ?? [];
        getDoctorList(specializationId: specializationData?.first?.id);
        emit(HomeState.specializationsSuccess(specializationData));
      },
      failure: (error) {
        emit(HomeState.specializationsError(error));
      },
    );
  }

  void getDoctorList({required int? specializationId}) {
    List<Doctors?>? doctorsList =
        filterSpecializationDoctorById(specializationId);
    if (!doctorsList.isNullorEmpty()) {
      emit(HomeState.doctorSuccess(doctorsList));
    } else {
      emit(HomeState.doctorError(ErrorHandler.handle("No Doctor Found")));
    }
  }

  filterSpecializationDoctorById(specializationId) {
    return specializationData
        ?.firstWhere((specialization) => specialization?.id == specializationId)
        ?.doctorsList;
  }
}