import 'package:dio/dio.dart';

class HttpClient {
  final Dio httpClient =
      Dio(BaseOptions(baseUrl: 'http://expertdevelopers.ir/api/v1/'));
}
