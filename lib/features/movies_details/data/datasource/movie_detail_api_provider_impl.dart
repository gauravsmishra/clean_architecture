import 'package:dio/dio.dart';
import 'package:imdb_poc/api/api_response.dart';
import 'package:imdb_poc/features/movies_details/data/datasource/movie_detail_api_provider.dart';

import '../../../../api/api_constant.dart';
import '../../../../api/api_service.dart';

class MovieDetailsApiProviderImpl implements MovieDetailsApiProvider {
  MovieDetailsApiProviderImpl({required this.api});
  ApiService api;
  @override
  Future<ApiResponse> getMoviesDetails(int movieId) async {
    try {
      Map<String, dynamic> query = {
        'append_to_response': 'release_dates,videos,casts,recommendations'
      };
      final response = await api.dio.get(
          ApiConstants.movieDetail + movieId.toString(),
          queryParameters: query);
      return ApiResponse.success(response);
    } on DioException catch (e) {
      return ApiResponse.failure(e);
    }
  }
}
