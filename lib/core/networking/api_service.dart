import 'package:appointment_app/core/networking/api_constants.dart';
import 'package:appointment_app/features/login/data/model/login_response.dart';
import 'package:appointment_app/features/sign_up/data/model/signup_request_body.dart';
import 'package:appointment_app/features/sign_up/data/model/signup_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../features/login/data/model/login_request_body.dart';

// Generated file
part 'api_service.g.dart'; 

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiService {
  // Constructor with factory to generate _ApiService class
  factory ApiService(Dio dio, {String? baseUrl}) = _ApiService;

  @POST(ApiConstants.login) 
  Future<LoginResponse> login(
    @Body() LoginRequestBody loginRequestBody,
  );
  
  @POST(ApiConstants.signup) 
  Future<SignupResponse> signup(
    @Body() SignupRequestBody signupRequestBody,
  );
}
