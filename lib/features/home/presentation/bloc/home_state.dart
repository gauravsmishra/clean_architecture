part of 'home_bloc.dart';

abstract class HomeState {}

final class HomeInitial extends HomeState {}

class FetchPopularMoviesState extends HomeState {
  ApiStatus? state;
  ApiStatus? get apiState => state;
  MoviesModel? popularMoviesModel;
  String? error;

  FetchPopularMoviesState(this.state, {this.popularMoviesModel, this.error});
}

class FetchTopRatedState extends HomeState {
  ApiStatus? state;
  ApiStatus? get apiState => state;
  MoviesModel? topRatedModel;
  String? error;

  FetchTopRatedState(this.state, {this.topRatedModel, this.error});
}

class FetchUpcommingMoviesState extends HomeState {
  ApiStatus? state;
  ApiStatus? get apiState => state;
  MoviesModel? upcommingMoviesModel;
  String? error;

  FetchUpcommingMoviesState(this.state,
      {this.upcommingMoviesModel, this.error});
}
