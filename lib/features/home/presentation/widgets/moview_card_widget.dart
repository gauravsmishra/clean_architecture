import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:imdb_poc/core/styles/styles.dart';
import 'package:imdb_poc/core/utils/common_widgets.dart';
import 'package:imdb_poc/core/utils/extensions.dart';
import 'package:imdb_poc/features/movies_details/presentation/controller/moview_details_controller.dart';

import '../../../../core/theme/app_colors.dart';
import '../../domain/model/response/movies_model.dart';

class MovieItem extends StatelessWidget {
  const MovieItem({
    required this.movie,
    required this.index,
    super.key,
  });

  final Movies movie;
  final int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (movie.id != null) {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => MovieDetailsController(movieId: movie.id!),
          ));
        }
      },
      child: Container(
        width: 160.0,
        // height: 300.0,
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          // color: AppColors.whiteColor,
          color: Theme.of(context).colorScheme.secondaryContainer,
          borderRadius: const BorderRadius.all(Radius.circular(12.0)),
          boxShadow: [
            BoxShadow(
              color: AppColors.grey50Color.withOpacity(0.5),
              blurRadius: 4.0,
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              imageUrl: movie.posterPath ?? '',
              imageBuilder: (context, imageProvider) => Container(
                height: 190,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              placeholder: (context, url) => Container(
                height: 190,
                decoration: BoxDecoration(
                  color: Theme.of(context).disabledColor.withOpacity(0.9),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                ),
                child: Center(
                  child: Icon(Icons.image,
                      size: 45,
                      color:
                          Theme.of(context).iconTheme.color!.withOpacity(0.5)),
                ),
              ),
              errorWidget: (context, url, error) => Container(
                height: 190,
                decoration: BoxDecoration(
                  color: Theme.of(context).disabledColor.withOpacity(0.5),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                ),
                child: Center(
                  child: Icon(Icons.image,
                      size: 45,
                      color:
                          Theme.of(context).iconTheme.color!.withOpacity(0.4)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Column(
                // mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  vSpace(10),
                  Text(
                    movie.title ?? "",
                    maxLines: 2,
                    style: Styles.mediumTextWidgetStyle(
                      size: 16,
                      textoverFlow: true,
                    ),
                  ),
                  vSpace(6),
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
                        style: Styles.regularTextWidgetStyle(size: 12),
                      ),
                    ],
                  ),
                  vSpace(6),
                  if (movie.releaseDate != null)
                    Text(
                      movie.releaseDate!.toFormattedString(),
                      maxLines: 2,
                      softWrap: true,
                      style: Styles.regularTextWidgetStyle(size: 12),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
