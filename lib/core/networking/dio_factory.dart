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

  static void addDioHeader() {
    dio?.options.headers = {
      'Accept': 'application/json',
      'Authorization':
          'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3ZjYXJlLmludGVncmF0aW9uMjUuY29tL2FwaS9hdXRoL2xvZ2luIiwiaWF0IjoxNzI4MzkzNjgxLCJleHAiOjE3Mjg0ODAwODEsIm5iZiI6MTcyODM5MzY4MSwianRpIjoiZVhPcThRMExUbm5pbjlHUiIsInN1YiI6IjIzMjkiLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.xxCmqXuNqCinaLoZ65P878OQjTOlL-LscdkYIlwiKs8'
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
