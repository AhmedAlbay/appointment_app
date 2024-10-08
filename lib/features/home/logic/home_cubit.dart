import 'package:appointment_app/features/home/data/repo/home_repo.dart';
import 'package:appointment_app/features/home/logic/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;
  HomeCubit(this._homeRepo) : super(HomeState.initial());
  void getSpecializations() async {
    emit(HomeState.specializationsLoading());
    final response = await _homeRepo.getSpecializations();
    response.when(
      success: (data) {
        emit(HomeState.specializationsSuccess(data));
      },
      failure: (error) {
        emit(HomeState.specializationsError(error));
      },
    );
  }
}
