import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ApiResponse<T> {
  int? code;
  late T? body;

  DioException? error;
  bool success = false;

  ApiResponse.success(Response<T> response) {
    code = response.statusCode ?? 0;
    body = response.data ?? "" as T?;
    success = true;
  }

  ApiResponse.failure(DioException e) {
    error = e;
    code = e.response?.statusCode ?? 0;
    // if (e is DioError) {
    body = e.response?.data;
    if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout) {
      code = 408;
      body = null;
      debugPrint("Timeout Error: ${e.message}");
    }
    debugPrint("Error = ${e.response?.data}");
    debugPrint("Error Code = ${e.response?.statusCode}");
  }
  // }
}
