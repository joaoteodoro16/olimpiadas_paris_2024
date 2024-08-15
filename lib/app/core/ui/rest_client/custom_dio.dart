import 'package:dio/dio.dart';
import 'package:dio/io.dart';

class CustomDio extends DioForNative {
  CustomDio()
      : super(
          BaseOptions(
            baseUrl: "https://apis.codante.io/olympic-games",
            connectTimeout: const Duration(seconds: 5),
            receiveTimeout: const Duration(
              seconds: 60,
            ),
          ),
        ) {
    interceptors.add(LogInterceptor(
      requestBody: true,
      responseBody: true,
      requestHeader: true,
    ));
  }
}
