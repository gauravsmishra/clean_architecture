import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imdb_poc/api/api_service.dart';
import 'package:imdb_poc/core/utils/common_widgets.dart';
import 'package:imdb_poc/core/utils/extensions.dart';
import 'package:imdb_poc/features/movies_details/presentation/bloc/movie_details_bloc.dart';
import 'package:imdb_poc/features/movies_details/presentation/widgets/recommendation_widget.dart';
import 'package:imdb_poc/features/movies_details/presentation/widgets/shimmers/movie_details_screen_shimmer.dart';
import '../../../../core/styles/styles.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/strings.dart';
import '../../../../core/widget_view_base.dart';
import '../../domain/models/response/movie_details_model.dart';
import '../controller/moview_details_controller.dart';
import '../widgets/poster_widget.dart';

class MovieDetailsScreenWidgetView
    extends WidgetView<MovieDetailsController, MovieDetailsControllerState> {
  const MovieDetailsScreenWidgetView(super.controllerState, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<MovieDetailsBloc, MovieDetailsState>(
          listener: (context, state) {
            controllerState.handleBlocState(state);
          },
          buildWhen: (previous, current) => current is FetchMovieDetailsState,
          builder: (context, state) {
            if (state is FetchMovieDetailsState) {
              if (state.apiState == ApiStatus.initial) {
                return const MovieDetailsScreenShimmer();
              } else {
                return NestedScrollView(
                  headerSliverBuilder:
                      (BuildContext context, bool innerBoxIsScrolled) {
                    return <Widget>[appBarSliver(context)];
                  },
                  body: SingleChildScrollView(
                      child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      moviesDetailsWidget(),
                      _castList(),
                      vSpace(10),
                      RecommendationWidget(
                          recommendationsList: controllerState.movieDetailsModel
                                  ?.recommendations?.results ??
                              [])
                    ],
                  )),
                );
              }
            }
            return const MovieDetailsScreenShimmer();
          },
        ),
      ),
    );
  }

  SliverAppBar appBarSliver(BuildContext context) => SliverAppBar(
        backgroundColor: AppColors.blackBackgroundColor,
        surfaceTintColor: AppColors.blackBackgroundColor,
        expandedHeight: 280,
        floating: false,
        pinned: true,
        snap: false,
        automaticallyImplyLeading: true,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Platform.isAndroid ? Icons.arrow_back : Icons.arrow_back_ios,
            color: AppColors.whiteColor,
          ),
        ),
        flexibleSpace: FlexibleSpaceBar(
          title: Text(
            controllerState.movieDetailsModel?.title ?? "",
            style: Styles.semiBoldTextWidgetStyle(
                size: 16, color: AppColors.whiteColor),
          ),
          background: Column(
            children: [
              PosterWidget(controllerState.movieDetailsModel),
            ],
          ),
          titlePadding: const EdgeInsets.all(16.0),
          centerTitle: true,
        ),
      );

  Container moviesDetailsWidget() => Container(
        color: AppColors.blackBackgroundColor,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  rating,
                  style: Styles.semiBoldTextWidgetStyle(
                      size: 15, color: AppColors.whiteColor),
                ),
                hSpace(10),
                const Icon(
                  Icons.star,
                  color: AppColors.redColor,
                  size: 18,
                ),
                hSpace(3),
                Text(
                  controllerState.movieDetailsModel?.voteAverage
                          ?.toStringAsFixed(2) ??
                      "",
                  style: Styles.semiBoldTextWidgetStyle(
                      size: 15, color: AppColors.whiteColor),
                ),
              ],
            ),
            vSpace(8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                controllerState.findCertification(
                    controllerState.movieDetailsModel?.releaseDates),
                Text(
                  ' ',
                  style: Styles.regularTextWidgetStyle(
                      size: 12, color: AppColors.whiteColor),
                ),
                Text(
                  controllerState.movieDetailsModel?.runtime
                          ?.toRuntimeString() ??
                      "",
                  style: Styles.normalTextWidgetStyle(
                      size: 13, color: AppColors.whiteColor),
                ),
                hSpace(6),
                _playVideoWidget()
              ],
            ),
            vSpace(25),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    overeview,
                    maxLines: 2,
                    style: Styles.boldTextWidgetStyle(
                        size: 18, color: AppColors.whiteColor),
                  ),
                  vSpace(5),
                  Text(
                    controllerState.movieDetailsModel?.overview ?? "",
                    style: Styles.normalTextWidgetStyle(
                        size: 14, color: AppColors.whiteColor),
                  ),
                  vSpace(20)
                ],
              ),
            ),
          ],
        ),
      );

  Widget _playVideoWidget() {
    if (controllerState.movieDetailsModel?.videos != null) {
      VideoModel? latestVideo = controllerState
          .getLatestVideo(controllerState.movieDetailsModel!.videos!);
      if (latestVideo != null) {
        return Row(
          children: [
            const Icon(Icons.play_arrow_rounded, color: AppColors.whiteColor),
            InkWell(
              onTap: () => controllerState.onPlayVideoPressed(latestVideo),
              child: Text(
                '$play ${latestVideo.type ?? ""}',
                style: Styles.mediumTextWidgetStyle(
                    size: 13, color: AppColors.whiteColor),
              ),
            )
          ],
        );
      }
      return const SizedBox.shrink();
    }
    return const SizedBox.shrink();
  }

  Widget _castList() {
    if (controllerState.movieDetailsModel?.casts?.cast != null &&
        controllerState.movieDetailsModel!.casts!.cast!.isNotEmpty) {
      return Padding(
        padding: const EdgeInsets.only(left: 16, top: 20),
        child: SizedBox(
          height: 130,
          child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                Cast cast =
                    controllerState.movieDetailsModel!.casts!.cast![index];
                return SizedBox(
                  width: 100,
                  child: Column(
                    children: [
                      CachedNetworkImage(
                        imageUrl: cast.profilePath ?? '',
                        imageBuilder: (context, imageProvider) => Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        placeholder: (context, url) => Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Theme.of(context)
                                  .disabledColor
                                  .withOpacity(0.5)),
                          child: Icon(Icons.person,
                              size: 45,
                              color: Theme.of(context)
                                  .iconTheme
                                  .color!
                                  .withOpacity(0.4)),
                        ),
                        errorWidget: (context, url, error) => Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Theme.of(context)
                                  .disabledColor
                                  .withOpacity(0.5)),
                          child: Icon(Icons.person,
                              size: 45,
                              color: Theme.of(context)
                                  .iconTheme
                                  .color!
                                  .withOpacity(0.4)),
                        ),
                      ),
                      vSpace(8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            cast.name ?? "",
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            style: Styles.mediumTextWidgetStyle(
                                textoverFlow: true, size: 11),
                          ),
                          vSpace(1),
                          Text(
                            cast.character ?? "",
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            style: Styles.regularTextWidgetStyle(
                                textoverFlow: true, size: 9),
                          )
                        ],
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) => hSpace(5),
              itemCount:
                  controllerState.movieDetailsModel!.casts!.cast!.length),
        ),
      );
    } else {
      return vSpace(0);
    }
  }
}
