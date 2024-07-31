import 'package:flutter/material.dart';
import 'package:imdb_poc/core/utils/common_app_bar.dart/common_app_bar.dart';
import 'package:imdb_poc/core/utils/common_widgets.dart';
import 'package:imdb_poc/features/home/presentation/widgets/popular_movies_widget.dart';
import 'package:imdb_poc/features/home/presentation/widgets/top_rated_movies_widget.dart';
import 'package:imdb_poc/features/home/presentation/widgets/upcomming_movies_widget.dart';
import '../../../../core/widget_view_base.dart';
import '../controller/home_screen_controller.dart';

class HomeScreenWidgetView
    extends WidgetView<HomeScreenController, HomeScreenControllerState> {
  const HomeScreenWidgetView(super.controllerState, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar.backIconAppbar(context, showBackIcon: false),
      body: RefreshIndicator(
        backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
        color: Theme.of(context).colorScheme.primary,
        onRefresh: () async {
          controllerState.refreshMoviesData();
        },
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const PopularMoviesWidget(),
              vSpace(32.0),
              const TopRatedMoviesWidget(),
              vSpace(32.0),
              const UpcommingMoviesWidget(),
              vSpace(32.0),
            ],
          ),
        ),
      ),
    );
  }
}
