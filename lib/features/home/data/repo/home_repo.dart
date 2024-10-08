import 'package:appointment_app/core/networking/api_error_handler.dart';
import 'package:appointment_app/core/networking/api_result.dart';
import 'package:appointment_app/features/home/data/apis/home_service_api.dart';
import 'package:appointment_app/features/home/data/model/specializations_response_model.dart';

class HomeRepo {
  final HomeServiceApi _homeServiceApi ;


  HomeRepo(this._homeServiceApi);
   Future <ApiResult <SpecializationsResponseModel>> getSpecializations ()async {
    final response = await _homeServiceApi.getSpecializations();
    try {
    return  ApiResult.success(response);
    
    } catch (error) {
     return ApiResult.failure(ErrorHandler.handle(error));
    }
   }
  }