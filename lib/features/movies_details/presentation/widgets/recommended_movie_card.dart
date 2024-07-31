import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/styles/styles.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/common_widgets.dart';
import '../../../home/domain/model/response/movies_model.dart';
import '../controller/moview_details_controller.dart';

class RecommendedMovieCard extends StatelessWidget {
  const RecommendedMovieCard({
    required this.movie,
    required this.index,
    super.key,
  });

  final Movies movie;
  final int index;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 270,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              if (movie.id != null) {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) =>
                      MovieDetailsController(movieId: movie.id!),
                ));
              }
            },
            child: CachedNetworkImage(
              imageUrl: movie.backdropPath ?? '',
              imageBuilder: (context, imageProvider) => Container(
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              placeholder: (context, url) => Container(
                height: 150,
                decoration: BoxDecoration(
                  color: Theme.of(context).disabledColor.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Icon(Icons.image,
                      size: 45,
                      color:
                          Theme.of(context).iconTheme.color!.withOpacity(0.5)),
                ),
              ),
              errorWidget: (context, url, error) => Container(
                height: 150,
                decoration: BoxDecoration(
                  color: Theme.of(context).disabledColor.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Icon(Icons.image,
                      size: 45,
                      color:
                          Theme.of(context).iconTheme.color!.withOpacity(0.5)),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              // mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    movie.title ?? "",
                    maxLines: 2,
                    style: Styles.mediumTextWidgetStyle(
                      size: 16,
                      textoverFlow: true,
                    ),
                  ),
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: AppColors.redColor,
                      size: 15,
                    ),
                    hSpace(3),
                    Text(
                      movie.voteAverage?.toStringAsFixed(2) ?? "",
                      style: Styles.normalTextWidgetStyle(size: 14),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
