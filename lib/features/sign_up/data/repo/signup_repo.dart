import 'package:appointment_app/core/networking/api_error_handler.dart';
import 'package:appointment_app/core/networking/api_result.dart';
import 'package:appointment_app/core/networking/api_service.dart';
import 'package:appointment_app/features/sign_up/data/model/signup_request_body.dart';
import 'package:appointment_app/features/sign_up/data/model/signup_response.dart';

class SignupRepo {
  final ApiService _apiService;

  // Constructor for initializing ApiService
  SignupRepo(this._apiService);

  // Function to handle signup request
  Future<ApiResult<SignupResponse>> signup(SignupRequestBody signupRequestBody) async {
    try {
      // Make the signup API call using the ApiService
      final response = await _apiService.signup(signupRequestBody);

      // Return success if API call was successful
      return ApiResult.success(response);
    } catch (error) {
      // Handle any errors that occur during the API call
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
