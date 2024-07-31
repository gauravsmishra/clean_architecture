import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:imdb_poc/features/home/domain/model/response/movies_model.dart';
import 'package:imdb_poc/features/home/domain/repositories/home_repo.dart';
import '../../../../api/api_service.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepo _homeRepo;
  HomeBloc(this._homeRepo) : super(HomeInitial()) {
    on<FetchPopularMovies>(_handleFetchPopularMovies);
    on<FetchTopRatedMovies>(_handleFetchTopRatedMovies);
    on<FetchUpcommingMovies>(_handleFetchUpcommingMovies);
  }

  _handleFetchPopularMovies(
      FetchPopularMovies event, Emitter<HomeState> emit) async {
    try {
      if (event.pageNo == 1) {
        emit(FetchPopularMoviesState(ApiStatus.initial));
      } else {
        emit(FetchPopularMoviesState(ApiStatus.loading));
      }

      final MoviesModel moviesModel =
          await _homeRepo.getPopularMovies(event.pageNo);
      if (moviesModel.movies != null) {
        emit(FetchPopularMoviesState(ApiStatus.success,
            popularMoviesModel: moviesModel));
      } else {
        emit(FetchPopularMoviesState(ApiStatus.error,
            popularMoviesModel: moviesModel, error: moviesModel.statusMessage));
      }
    } catch (e) {
      emit(FetchPopularMoviesState(ApiStatus.error, error: e.toString()));
    }
  }

  _handleFetchTopRatedMovies(
      FetchTopRatedMovies event, Emitter<HomeState> emit) async {
    try {
      if (event.pageNo == 1) {
        emit(FetchPopularMoviesState(ApiStatus.initial));
      } else {
        emit(FetchPopularMoviesState(ApiStatus.loading));
      }

      final MoviesModel moviesModel =
          await _homeRepo.getTopRatedMovies(event.pageNo);
      if (moviesModel.movies != null) {
        emit(FetchTopRatedState(ApiStatus.success, topRatedModel: moviesModel));
      } else {
        emit(FetchTopRatedState(ApiStatus.error,
            topRatedModel: moviesModel, error: moviesModel.statusMessage));
      }
    } catch (e) {
      emit(FetchTopRatedState(ApiStatus.error, error: e.toString()));
    }
  }

  _handleFetchUpcommingMovies(
      FetchUpcommingMovies event, Emitter<HomeState> emit) async {
    try {
      log('Page no in bloc -- ${event.pageNo}');
      if (event.pageNo == 1) {
        emit(FetchPopularMoviesState(ApiStatus.initial));
      } else {
        emit(FetchPopularMoviesState(ApiStatus.loading));
      }

      final MoviesModel moviesModel =
          await _homeRepo.getUpcommingMovies(event.pageNo);
      if (moviesModel.movies != null) {
        emit(FetchUpcommingMoviesState(ApiStatus.success,
            upcommingMoviesModel: moviesModel));
      } else {
        emit(FetchUpcommingMoviesState(ApiStatus.error,
            upcommingMoviesModel: moviesModel,
            error: moviesModel.statusMessage));
      }
    } catch (e) {
      emit(FetchUpcommingMoviesState(ApiStatus.error, error: e.toString()));
    }
  }
}
