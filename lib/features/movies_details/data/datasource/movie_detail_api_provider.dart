import '../../../../api/api_response.dart';

abstract class MovieDetailsApiProvider {
  Future<ApiResponse> getMoviesDetails(int movieId);
}
