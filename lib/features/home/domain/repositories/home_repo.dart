import 'package:imdb_poc/features/home/domain/model/response/movies_model.dart';

abstract class HomeRepo {
  Future<MoviesModel> getUpcommingMovies(int pageNo);
  Future<MoviesModel> getPopularMovies(int pageNo);
  Future<MoviesModel> getTopRatedMovies(int pageNo);
}
