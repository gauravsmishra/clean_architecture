import 'dart:io';
import 'package:flutter/material.dart';
import 'package:imdb_poc/features/movies_details/presentation/widgets/shimmers/cast_card_shimmer.dart';
import 'package:imdb_poc/features/movies_details/presentation/widgets/shimmers/recommendation_widget_shimmer.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../../core/utils/common_widgets.dart';

class MovieDetailsScreenShimmer extends StatelessWidget {
  const MovieDetailsScreenShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Platform.isAndroid ? Icons.arrow_back : Icons.arrow_back_ios,
              size: 30,
              color: Theme.of(context).iconTheme.color,
            ),
          ),
        ),
        Shimmer.fromColors(
          baseColor: Theme.of(context).colorScheme.secondaryContainer,
          highlightColor: Theme.of(context).disabledColor,
          child: MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: Column(
              children: [
                Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        height: 140,
                        width: 110.0,
                        margin: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Theme.of(context).disabledColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    vSpace(20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        vSpace(10),
                        Container(
                          width: 200,
                          height: 18,
                          color: Theme.of(context).disabledColor,
                        ),
                        vSpace(8),
                        Container(
                          width: 60,
                          height: 15,
                          color: Theme.of(context).disabledColor,
                        ),
                        vSpace(8),
                        Container(
                          width: 180,
                          height: 15,
                          color: Theme.of(context).disabledColor,
                        ),
                      ],
                    ),
                  ],
                ),
                const ShimmerCastCard(),
                vSpace(15),
                const RecommendationWidgetShimmer(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
