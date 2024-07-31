import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../domain/models/response/movie_details_model.dart';

class PosterWidget extends StatelessWidget {
  const PosterWidget(this.movieDetailsModel, {super.key});
  final MovieDetailsModel? movieDetailsModel;

  @override
  Widget build(BuildContext context) {
    return _posterWidget();
  }

  Widget _posterWidget() {
    double posterHeight = 230;
    return SizedBox(
      height: posterHeight,
      width: double.maxFinite,
      child: Stack(
        children: [
          Stack(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 30,
                    height: posterHeight,
                  ),
                  Expanded(
                    child: CachedNetworkImage(
                      imageUrl: movieDetailsModel?.backdropPath ?? '',
                      imageBuilder: (context, imageProvider) => Container(
                        height: posterHeight,
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      placeholder: (context, url) => const SizedBox(
                        height: 220,
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                ],
              ),
              Container(
                width: 60,
                height: posterHeight,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                      AppColors.blackBackgroundColor,
                      AppColors.blackBackgroundColor.withOpacity(0.9),
                      Colors.transparent
                    ])),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.maxFinite,
                  height: 20,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                        AppColors.blackBackgroundColor,
                        Colors.transparent
                      ])),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
              child: CachedNetworkImage(
                imageUrl: movieDetailsModel?.posterPath ?? '',
                imageBuilder: (context, imageProvider) => Container(
                  height: 140,
                  width: 110.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
