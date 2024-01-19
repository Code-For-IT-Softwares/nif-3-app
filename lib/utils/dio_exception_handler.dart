import 'dart:convert';

import 'package:dio/dio.dart';

class DioErrorHandler implements Exception {
  String? message;
  DioErrorHandler.fromDioError(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.cancel:
        message = "Request to API server was cancelled";
        break;
      case DioExceptionType.connectionTimeout:
        message = "Connection timeout";
        break;
      case DioExceptionType.receiveTimeout:
        message = "Receive timeout";
        break;
      case DioExceptionType.badResponse:
        message = _handleError(
            dioException.response!.statusCode, dioException.response!.data);
        break;
      case DioExceptionType.sendTimeout:
        message = "Send timeout in connection";
        break;
      default:
        message = "Something went wrong";
        break;
    }
  }

  String _handleError(int? statusCode, dynamic error) {
    Map<String, dynamic> map = jsonDecode(error);
    switch (statusCode) {
      case 400:
        return 'Bad request';
      case 401:
        return map["message"];
      case 409:
        return map["message"];
      case 404:
        return map["message"];
      case 500:
        return 'Internal server error';
      default:
        return 'Oops something went wrong';
    }
  }

  @override
  String toString() => message!;
}
