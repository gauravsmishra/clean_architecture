import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imdb_poc/core/theme/dark_theme.dart';
import 'package:imdb_poc/features/home/presentation/controller/home_screen_controller.dart';
import 'package:imdb_poc/features/movies_details/presentation/bloc/movie_details_bloc.dart';
import 'package:injector/injector.dart';
import 'core/di.dart';
import 'core/theme/light_theme.dart';
import 'core/utils/constants.dart';
import 'core/utils/strings.dart';
import 'features/home/presentation/bloc/home_bloc.dart';
import 'features/splash/presentation/controller/splash_screen_controller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupDependencyInjections();
  Const.navigatorKey = GlobalKey<NavigatorState>();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            return Injector.appInstance.get<HomeBloc>();
          },
        ),
        BlocProvider(
          create: (context) {
            return Injector.appInstance.get<MovieDetailsBloc>();
          },
        ),
      ],
      child: MaterialApp(
        navigatorKey: Const.navigatorKey,
        debugShowCheckedModeBanner: false,
        onGenerateTitle: (context) => appName,
        theme: lightTheme,
        darkTheme: darkTheme,
        title: appName,
        home: const SplashScreenController(),
      ),
    );
  }
}
