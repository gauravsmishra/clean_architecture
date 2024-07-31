import 'package:flutter/material.dart';
import 'package:imdb_poc/features/home/presentation/controller/home_screen_controller.dart';

import '../widget_view/splash_screen_widget_view.dart';

class SplashScreenController extends StatefulWidget {
  const SplashScreenController({super.key});

  @override
  State<SplashScreenController> createState() => SplashScreenControllerState();
}

class SplashScreenControllerState extends State<SplashScreenController> {
  @override
  void initState() {
    navHandler();
    super.initState();
  }

  void navHandler() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(
          const Duration(seconds: 2),
          () => Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => const HomeScreenController(),
              ),
              (Route<dynamic> route) => false));
    });
  }

  @override
  Widget build(BuildContext context) => SplashScreenWidgetView(this);
}
