
import 'package:appointment_app/core/networking/api_constants.dart';
import 'package:appointment_app/features/home/data/model/specializations_response_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
part 'home_service_api.g.dart';
@RestApi(baseUrl:ApiConstants.apiBaseUrl)

abstract class HomeServiceApi {
  factory HomeServiceApi(Dio dio, {String? baseUrl}) = _HomeServiceApi;
   @GET(ApiConstants.doctorSpecializtion)
   Future<SpecializationsResponseModel> getSpecializations();


}