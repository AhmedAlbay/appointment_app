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
        return dio!;

    }else{
      return dio!; 

    }
  }
  static void  addDioInterceptor() {
  dio?.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,));

}
}