import 'package:imdb_poc/features/movies_details/domain/models/response/movie_details_model.dart';

abstract class MoviesDetailRepo {
  Future<MovieDetailsModel> getMovieDetails(int movieId);
}
