import '../../../../api/api_response.dart';

abstract class HomeApiProvider {
  Future<ApiResponse> getPopularMovies(int pageNo);
  Future<ApiResponse> getTopRatedMovies(int pageNo);
  Future<ApiResponse> getUpcommingMoview(int pageNo);
}
