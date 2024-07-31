import 'package:bloc/bloc.dart';
import 'package:imdb_poc/features/movies_details/domain/models/response/movie_details_model.dart';
import '../../../../api/api_service.dart';
import '../../domain/repositories/movie_details_repo.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final MoviesDetailRepo _moviesDetailRepo;
  MovieDetailsBloc(this._moviesDetailRepo) : super(MovieDetailsInitial()) {
    on<FetchMovieDetails>(_handleFetchMovieDetails);
  }
  _handleFetchMovieDetails(
      FetchMovieDetails event, Emitter<MovieDetailsState> emit) async {
    try {
      emit(FetchMovieDetailsState(ApiStatus.initial));
      final MovieDetailsModel moviesModel =
          await _moviesDetailRepo.getMovieDetails(event.movieId);
      if (moviesModel.id != null) {
        emit(FetchMovieDetailsState(ApiStatus.success,
            movieDetailsModel: moviesModel));
      } else {
        emit(FetchMovieDetailsState(ApiStatus.error,
            movieDetailsModel: moviesModel, error: moviesModel.statusMessage));
      }
    } catch (e) {
      emit(FetchMovieDetailsState(ApiStatus.error, error: e.toString()));
    }
  }
}
