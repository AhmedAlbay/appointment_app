import 'package:appointment_app/core/networking/api_constants.dart';
import 'package:appointment_app/features/login/data/model/login_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../features/login/data/model/login_request_body.dart';
// To generate the Retrofit code
part 'api_service.g.dart'; 
@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiService {
 
  factory ApiService(Dio dio, {String? baseUrl}) = _ApiService;


  @POST(ApiConstants.login) 
  Future<LoginResponse> login(
    @Body() LoginRequestBody loginRequestBody,
  );
}