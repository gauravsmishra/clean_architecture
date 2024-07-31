import 'package:imdb_poc/features/movies_details/data/datasource/movie_detail_api_provider.dart';
import 'package:imdb_poc/features/movies_details/domain/models/response/movie_details_model.dart';
import 'package:imdb_poc/features/movies_details/domain/repositories/movie_details_repo.dart';

import '../../../../api/error_response.dart';

class MovieDetailsRepoImpl implements MoviesDetailRepo {
  final MovieDetailsApiProvider _detailApiProvider;

  MovieDetailsRepoImpl(this._detailApiProvider);
  @override
  Future<MovieDetailsModel> getMovieDetails(int movieId) async {
    final response = await _detailApiProvider.getMoviesDetails(movieId);
    if (response.success) {
      MovieDetailsModel movieDetailsModel =
          MovieDetailsModel.fromJson(response.body);
      return movieDetailsModel;
    } else {
      final message = ErrorResponse.fromJson(response.body);
      return MovieDetailsModel(
          statusMessage: message.message, success: false, id: null);
    }
  }
}
