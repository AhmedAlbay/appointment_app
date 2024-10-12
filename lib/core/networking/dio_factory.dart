import 'package:appointment_app/core/helpers/constants.dart';
import 'package:appointment_app/core/helpers/shared_pref_helper.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  // This line declares a class named DioFactory. The _ in the constructor DioFactory._() makes the constructor private, which prevents the instantiation of this class from outside, effectively making it a singleton.
  DioFactory._();

  static Dio? dio;
  static Dio getDio() {
    Duration timeOut = const Duration(seconds: 30);
    if (dio == null) {
      dio = Dio();
      dio!
        ..options.connectTimeout = timeOut
        ..options.receiveTimeout = timeOut;
      addDioInterceptor();
      addDioHeader();
      return dio!;
    } else {
      return dio!;
    }
  }

  static void addDioHeader()async {
    dio?.options.headers = {
      'Accept': 'application/json',
      'Authorization':
          'Bearer ${await SharedPrefHelper.getSecuredString(SharedPreKey.userToken)}'
    };
  }
  static void setTokenAfterLogin(String token){
     dio?.options.headers = {
      
      'Authorization':
          'Bearer $token}'
    };
  }

  static void addDioInterceptor() {
    dio?.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseHeader: true,
    ));
  }
}
