import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imdb_poc/core/styles/styles.dart';
import 'package:imdb_poc/core/theme/app_colors.dart';
import 'package:imdb_poc/core/utils/common_widgets.dart';
import 'package:imdb_poc/core/utils/extensions.dart';
import 'package:imdb_poc/features/movies_details/presentation/bloc/movie_details_bloc.dart';
import 'package:imdb_poc/features/movies_details/presentation/widget_view/movie_details_widget_view.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../api/api_constant.dart';
import '../../../../api/api_service.dart';
import '../../domain/models/response/movie_details_model.dart';

class MovieDetailsController extends StatefulWidget {
  final int movieId;
  const MovieDetailsController({super.key, required this.movieId});

  @override
  State<MovieDetailsController> createState() => MovieDetailsControllerState();
}

class MovieDetailsControllerState extends State<MovieDetailsController> {
  MovieDetailsModel? movieDetailsModel;

  // Function to find the certification in prority of 'IN', 'US', 'GB' and then show the certification widget
  Widget findCertification(Releases? releases) {
    if (releases != null) {
      const List<String> priorityCountries = ['IN', 'US', 'GB'];

      for (String countryCode in priorityCountries) {
        for (Results country in releases.results!) {
          if (country.iso31661 == countryCode) {
            for (ReleaseDates date in country.releaseDates!) {
              if (date.certification != null &&
                  date.certification!.isNotEmpty) {
                '${date.certification!} ${date.releaseDate!.toFormattedString()}';
                return certificationWidget(date, country.iso31661.toString());
              }
            }
          }
        }
      }

      // If none of the priority countries have a certification, return the first available certification
      for (Results country in releases.results!) {
        for (ReleaseDates date in country.releaseDates!) {
          if (date.certification != null && date.certification!.isNotEmpty) {
            return certificationWidget(date, country.iso31661.toString());
          }
        }
      }
    }
    // If no certification is found or releases are null, return null
    return vSpace(0);
  }

  /// Creates a widget displaying certification and release date information.
  /// Displays the certification and formatted release date along with the country code.
  Widget certificationWidget(ReleaseDates releaseDate, String countryISO) =>
      Row(
        children: [
          Container(
            decoration: BoxDecoration(
                border: Border.all(width: 0.5, color: AppColors.whiteColor),
                borderRadius: BorderRadius.circular(4)),
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
            child: Text(
              releaseDate.certification ?? "",
              style: Styles.regularTextWidgetStyle(
                  size: 13, color: AppColors.whiteColor),
            ),
          ),
          hSpace(5),
          Text(
            '${releaseDate.releaseDate!.toFormattedString()} ($countryISO)',
            style: Styles.normalTextWidgetStyle(
                size: 13, color: AppColors.whiteColor),
          ),
        ],
      );

  /// Returns the latest available Trailer, Teaser, or any Video from the provided [videos].
  VideoModel? getLatestVideo(Videos videos) {
    // Initialize variables to store the latest Trailer, Teaser, and any Video
    VideoModel? latestTrailer;
    VideoModel? latestTeaser;
    VideoModel? latestVideo;

    // Loop through each video in the results list
    for (VideoModel video in videos.results!) {
      DateTime videoDate = DateTime.parse(video.publishedAt!);

      // Check if the video is a Trailer and update latestTrailer if it's the latest one
      if (video.type == 'Trailer') {
        if (latestTrailer == null ||
            videoDate.isAfter(DateTime.parse(latestTrailer.publishedAt!))) {
          latestTrailer = video;
        }
      }

      // Check if the video is a Teaser and update latestTeaser if it's the latest one
      else if (video.type == 'Teaser') {
        if (latestTeaser == null ||
            videoDate.isAfter(DateTime.parse(latestTeaser.publishedAt!))) {
          latestTeaser = video;
        }
      }

      // Update latestVideo if it's the latest one regardless of type
      if (latestVideo == null ||
          videoDate.isAfter(DateTime.parse(latestVideo.publishedAt!))) {
        latestVideo = video;
      }
    }

    // Return the latest Trailer if available
    if (latestTrailer != null) {
      return latestTrailer;
    }

    // Return the latest Teaser if no Trailer is available
    else if (latestTeaser != null) {
      return latestTeaser;
    }

    // Return the latest Video if neither Trailer nor Teaser is available
    else {
      return latestVideo;
    }
  }

  /// Launches the YouTube video if the key is valid; shows a toast if unable to play.
  Future<void> onPlayVideoPressed(VideoModel video) async {
    if (video.key != null) {
      Uri url = Uri.parse(ApiConstants.youtubevideoUrl + video.key!);
      if (await canLaunchUrl(url)) {
        await launchUrl(url);
      } else {
        // show a toast message that unable to play this video
        toast('unable to play this video');
      }
    }
  }

  void handleBlocState(Object? state) async {
    if (state is FetchMovieDetailsState) {
      if (state.state == ApiStatus.success) {
        if (state.movieDetailsModel?.id != null) {
          movieDetailsModel = state.movieDetailsModel;
        }
      } else if (state.state == ApiStatus.error) {
        toast(state.error ?? "");
      }
    }
  }

  @override
  void initState() {
    BlocProvider.of<MovieDetailsBloc>(context)
        .add(FetchMovieDetails(widget.movieId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) => MovieDetailsScreenWidgetView(this);
}
