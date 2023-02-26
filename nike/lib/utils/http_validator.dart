import 'package:dio/dio.dart';
import 'package:nike/utils/exception.dart';

mixin ResponseValidator {
  responseValidator(Response response) {
    if (response.statusCode != 200) {
      throw AppException(errorMessage: 'عملیات موفقیت آمیز نبود');
    }
  }
}
