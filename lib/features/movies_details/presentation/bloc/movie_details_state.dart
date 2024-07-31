part of 'movie_details_bloc.dart';

abstract class MovieDetailsState {}

final class MovieDetailsInitial extends MovieDetailsState {}

class FetchMovieDetailsState extends MovieDetailsState {
  ApiStatus? state;
  ApiStatus? get apiState => state;
  MovieDetailsModel? movieDetailsModel;
  String? error;

  FetchMovieDetailsState(this.state, {this.movieDetailsModel, this.error});
}
