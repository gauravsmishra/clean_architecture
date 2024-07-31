import 'package:imdb_poc/features/home/data/data_source/home_api_provider.dart';
import 'package:imdb_poc/features/home/domain/model/response/movies_model.dart';

import '../../../../api/error_response.dart';
import '../../domain/repositories/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final HomeApiProvider _homeApiProvider;

  HomeRepoImpl(this._homeApiProvider);
  @override
  Future<MoviesModel> getPopularMovies(int pageNo) async {
    final response = await _homeApiProvider.getPopularMovies(pageNo);
    if (response.success) {
      MoviesModel loginResponseModel = MoviesModel.fromJson(response.body);
      return loginResponseModel;
    } else {
      final message = ErrorResponse.fromJson(response.body);
      return MoviesModel(
          statusMessage: message.message, movies: null, success: false);
    }
  }

  @override
  Future<MoviesModel> getTopRatedMovies(int pageNo) async {
    final response = await _homeApiProvider.getTopRatedMovies(pageNo);
    if (response.success) {
      MoviesModel loginResponseModel = MoviesModel.fromJson(response.body);
      return loginResponseModel;
    } else {
      final message = ErrorResponse.fromJson(response.body);
      return MoviesModel(
          statusMessage: message.message, movies: null, success: false);
    }
  }

  @override
  Future<MoviesModel> getUpcommingMovies(int pageNo) async {
    final response = await _homeApiProvider.getUpcommingMoview(pageNo);
    if (response.success) {
      MoviesModel loginResponseModel = MoviesModel.fromJson(response.body);
      return loginResponseModel;
    } else {
      final message = ErrorResponse.fromJson(response.body);
      return MoviesModel(
          statusMessage: message.message, movies: null, success: false);
    }
  }
}
