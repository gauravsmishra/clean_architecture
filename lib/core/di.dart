import 'package:imdb_poc/features/home/data/data_source/home_api_provider.dart';
import 'package:imdb_poc/features/home/data/data_source/home_api_provider_impl.dart';
import 'package:imdb_poc/features/home/domain/repositories/home_repo.dart';
import 'package:imdb_poc/features/home/data/repositories_impl/home_repo_impl.dart';
import 'package:imdb_poc/features/home/presentation/bloc/home_bloc.dart';
import 'package:imdb_poc/features/movies_details/data/datasource/movie_detail_api_provider_impl.dart';
import 'package:imdb_poc/features/movies_details/domain/repositories/movie_details_repo.dart';
import 'package:injector/injector.dart';
import '../api/api_service.dart';
import '../features/movies_details/data/datasource/movie_detail_api_provider.dart';
import '../features/movies_details/data/repositories_impl/movie_details_repo_impl.dart';
import '../features/movies_details/presentation/bloc/movie_details_bloc.dart';

void setupDependencyInjections() async {
  Injector injector = Injector.appInstance;
  injector.registerSingleton<ApiService>(() => ApiService());

  _homeRepositoryDI(injector);
  _homeProviderDI(injector);
  _homeBlocDI(injector);

  _movieDetailsRepositoryDI(injector);
  _movieDetailsProviderDI(injector);
  _movieDetailsBlocDI(injector);
}

/// Home module di
void _homeRepositoryDI(Injector injector) {
  injector.registerDependency<HomeRepo>(() {
    return HomeRepoImpl(injector());
  });
}

void _homeProviderDI(Injector injector) {
  injector.registerDependency<HomeApiProvider>(() {
    ApiService api = injector.get<ApiService>();
    return HomeApiProviderImpl(api: api);
  });
}

void _homeBlocDI(Injector injector) {
  injector.registerSingleton(() => HomeBloc(injector()));
}

/// Movie Details module di
void _movieDetailsRepositoryDI(Injector injector) {
  injector.registerDependency<MoviesDetailRepo>(() {
    return MovieDetailsRepoImpl(injector());
  });
}

void _movieDetailsProviderDI(Injector injector) {
  injector.registerDependency<MovieDetailsApiProvider>(() {
    ApiService api = injector.get<ApiService>();
    return MovieDetailsApiProviderImpl(api: api);
  });
}

void _movieDetailsBlocDI(Injector injector) {
  injector.registerSingleton(() => MovieDetailsBloc(injector()));
}
