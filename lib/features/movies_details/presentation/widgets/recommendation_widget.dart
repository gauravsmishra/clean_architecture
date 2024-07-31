import 'package:flutter/material.dart';
import 'package:imdb_poc/core/utils/common_widgets.dart';
import '../../../../core/styles/styles.dart';
import '../../../../core/utils/strings.dart';
import '../../../home/domain/model/response/movies_model.dart';
import 'recommended_movie_card.dart';

class RecommendationWidget extends StatelessWidget {
  const RecommendationWidget({super.key, required this.recommendationsList});

  final List<Movies> recommendationsList;

  @override
  Widget build(BuildContext context) {
    if (recommendationsList.isEmpty) {
      return const SizedBox.shrink();
    }
    return Padding(
      padding: const EdgeInsets.only(left: 18),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            recommendations,
            style: Styles.semiBoldTextWidgetStyle(size: 20),
          ),
          vSpace(15),
          SizedBox(
            height: 220,
            child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: recommendationsList.length,
              separatorBuilder: (_, int index) {
                return const SizedBox(width: 15.0);
              },
              itemBuilder: (_, index) {
                final movie = recommendationsList[index];
                return RecommendedMovieCard(
                  movie: movie,
                  index: index,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
