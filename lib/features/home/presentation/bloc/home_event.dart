part of 'home_bloc.dart';

abstract class HomeEvent {}

class FetchPopularMovies extends HomeEvent {
  int pageNo;
  FetchPopularMovies(this.pageNo);
}

class FetchTopRatedMovies extends HomeEvent {
  int pageNo;
  FetchTopRatedMovies(this.pageNo);
}

class FetchUpcommingMovies extends HomeEvent {
  int pageNo;
  FetchUpcommingMovies(this.pageNo);
}
