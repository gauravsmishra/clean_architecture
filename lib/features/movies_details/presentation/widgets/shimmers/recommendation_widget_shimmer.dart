import 'package:flutter/material.dart';

class RecommendationWidgetShimmer extends StatelessWidget {
  const RecommendationWidgetShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 20),
      child: SizedBox(
        height: 220,
        child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: 10, // Number of shimmer cards to show
          separatorBuilder: (_, int index) {
            return const SizedBox(width: 15.0);
          },
          itemBuilder: (_, index) {
            return const ShimmerRecommendedMovieCard();
          },
        ),
      ),
    );
  }
}

class ShimmerRecommendedMovieCard extends StatelessWidget {
  const ShimmerRecommendedMovieCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 270,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.grey,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Container(
              height: 20,
              width: 150,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
