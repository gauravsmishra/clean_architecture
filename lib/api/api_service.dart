import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'environment.dart';
import 'interceptor.dart';

class ApiService {
  static ApiService? _instance;

  factory ApiService() => _instance ??= ApiService._();

  ApiService._();

  static const String userAgent = "user-agent";
  static const _timeout = 30000; // Milliseconds
  static const _receiveTimeout = 30000; // Milliseconds

  bool get isInDebugMode {
    bool inDebugMode = kDebugMode;
    assert(inDebugMode = true);
    return inDebugMode;
  }

  Dio get dio => _dio();

  Dio _dio() {
    final options = BaseOptions(
      baseUrl: Environment.baseUrl,
      connectTimeout: const Duration(milliseconds: _timeout),
      receiveTimeout: const Duration(milliseconds: _receiveTimeout),
    );

    var dio = Dio(options);
    dio.interceptors.add(requestInterceptor(dio));
    return dio;
  }
}

enum ApiStatus { initial, loading, success, error }
