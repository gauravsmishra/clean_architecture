import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imdb_poc/api/api_service.dart';
import 'package:imdb_poc/core/styles/styles.dart';
import 'package:imdb_poc/core/utils/common_widgets.dart';
import 'package:imdb_poc/features/home/domain/model/response/movies_model.dart';
import 'package:imdb_poc/features/home/presentation/widgets/shimmer_list.dart';

import '../../../../core/utils/strings.dart';
import '../bloc/home_bloc.dart';
import 'moview_card_widget.dart';

/// [PopularMoviesWidget] displays a horizontal list of popular movies.
/// It fetches and shows movies from a BLoC state, handles pagination, and shows loading indicators.
class PopularMoviesWidget extends StatefulWidget {
  const PopularMoviesWidget({super.key});

  @override
  State<PopularMoviesWidget> createState() => _PopularMoviesWidgetState();
}

class _PopularMoviesWidgetState extends State<PopularMoviesWidget> {
  int pageNo = 1;

  int maxPageLength = 1;

  List<Movies> moviesList = [];

  void handleBlocState(Object? state) async {
    if (state is FetchPopularMoviesState) {
      if (state.state == ApiStatus.success) {
        if (state.popularMoviesModel?.movies != null) {
          maxPageLength = state.popularMoviesModel?.totalPages ?? 1;
          // If page is 1 means it the first data [Refresh] then clear the existing moviesList data
          if (state.popularMoviesModel?.page == 1) {
            moviesList.clear();
          }
          moviesList.addAll(state.popularMoviesModel!.movies!);
        }
      } else if (state.state == ApiStatus.error) {
        toast(state.error ?? "");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            popularMovies,
            style: Styles.semiBoldTextWidgetStyle(size: 20),
          ),
          const SizedBox(height: 16.0),
          SizedBox(
            height: 312,
            child: BlocConsumer<HomeBloc, HomeState>(
                listener: (context, state) => handleBlocState(state),
                listenWhen: (previous, current) =>
                    current is FetchPopularMoviesState,
                buildWhen: (previous, current) =>
                    current is FetchPopularMoviesState,
                builder: (context, state) {
                  if (state is FetchPopularMoviesState) {
                    if (state.apiState == ApiStatus.initial) {
                      return const ShimmerList();
                    }

                    if (moviesList.isEmpty) {
                      return const Text(
                          'Unable to fetch Popular movies, Please try again');
                    } else {
                      return NotificationListener(
                        onNotification: (scrollNotification) {
                          if (scrollNotification is UserScrollNotification) {
                            if (pageNo < maxPageLength &&
                                scrollNotification.metrics.pixels >=
                                    scrollNotification
                                        .metrics.maxScrollExtent) {
                              BlocProvider.of<HomeBloc>(context)
                                  .add(FetchPopularMovies(++pageNo));
                            }
                          }
                          return true;
                        },
                        child: ListView.separated(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: moviesList.length + 1,
                          separatorBuilder: (_, int index) {
                            return const SizedBox(width: 15.0);
                          },
                          itemBuilder: (_, index) {
                            if (index == moviesList.length) {
                              if (pageNo < maxPageLength) {
                                if (pageNo < maxPageLength) {
                                  return const SizedBox(
                                      height: 10,
                                      width: 40,
                                      child: Center(
                                          child: CircularProgressIndicator()));
                                } else {
                                  return vSpace(0);
                                }
                              } else {
                                return vSpace(0);
                              }
                            } else {
                              final movie = moviesList[index];
                              return MovieItem(
                                movie: movie,
                                index: index,
                              );
                            }
                          },
                        ),
                      );
                    }
                  } else {
                    return vSpace(0);
                  }
                }),
          ),
        ],
      ),
    );
  }
}
