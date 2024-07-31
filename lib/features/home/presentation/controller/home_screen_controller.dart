import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/home_bloc.dart';
import '../widget_view/home_screen_widget_view.dart';

class HomeScreenController extends StatefulWidget {
  const HomeScreenController({super.key});

  @override
  State<HomeScreenController> createState() => HomeScreenControllerState();
}

class HomeScreenControllerState extends State<HomeScreenController> {
  @override
  void initState() {
    fetchMoviesData();
    super.initState();
  }

  void fetchMoviesData() {
    BlocProvider.of<HomeBloc>(context).add(FetchPopularMovies(1));
    BlocProvider.of<HomeBloc>(context).add(FetchTopRatedMovies(1));
    BlocProvider.of<HomeBloc>(context).add(FetchUpcommingMovies(1));
  }

  void refreshMoviesData() {
    BlocProvider.of<HomeBloc>(context).add(FetchPopularMovies(1));
    BlocProvider.of<HomeBloc>(context).add(FetchTopRatedMovies(1));
    BlocProvider.of<HomeBloc>(context).add(FetchUpcommingMovies(1));
  }

  @override
  Widget build(BuildContext context) => HomeScreenWidgetView(this);
}
