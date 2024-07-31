part of 'movie_details_bloc.dart';

abstract class MovieDetailsEvent {}

class FetchMovieDetails extends MovieDetailsEvent {
  int movieId;
  FetchMovieDetails(this.movieId);
}
