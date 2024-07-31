import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:imdb_poc/api/api_response.dart';
import 'package:imdb_poc/features/home/data/data_source/home_api_provider.dart';

import '../../../../api/api_constant.dart';
import '../../../../api/api_service.dart';

class HomeApiProviderImpl implements HomeApiProvider {
  HomeApiProviderImpl({required this.api});
  ApiService api;

  @override
  Future<ApiResponse> getPopularMovies(int pageNo) async {
    try {
      Map<String, dynamic> query = {'page': pageNo};
      final response =
          await api.dio.get(ApiConstants.popularMovies, queryParameters: query);
      return ApiResponse.success(response);
    } on DioException catch (e) {
      return ApiResponse.failure(e);
    }
  }

  @override
  Future<ApiResponse> getTopRatedMovies(int pageNo) async {
    try {
      Map<String, dynamic> query = {'page': pageNo};
      final response = await api.dio
          .get(ApiConstants.topRatedMoview, queryParameters: query);
      return ApiResponse.success(response);
    } on DioException catch (e) {
      return ApiResponse.failure(e);
    }
  }

  @override
  Future<ApiResponse> getUpcommingMoview(int pageNo) async {
    try {
      Map<String, dynamic> query = {'page': pageNo};
      final response = await api.dio
          .get(ApiConstants.upcommingMovies, queryParameters: query);
      return ApiResponse.success(response);
    } on DioException catch (e) {
      return ApiResponse.failure(e);
    }
  }
}
