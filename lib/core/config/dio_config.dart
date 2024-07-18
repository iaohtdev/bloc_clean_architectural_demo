import 'package:dio/dio.dart';

class DioConfig {
  static BaseOptions options = BaseOptions(
      baseUrl: '',
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      queryParameters: {'language': 'vi'},
      headers: headers);
  static Map<String, dynamic>? headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': ''
  };
}
