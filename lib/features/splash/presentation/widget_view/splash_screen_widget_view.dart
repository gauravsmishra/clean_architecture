import 'package:flutter/material.dart';
import 'package:imdb_poc/core/styles/styles.dart';
import 'package:imdb_poc/core/widget_view_base.dart';
import 'package:imdb_poc/features/splash/presentation/controller/splash_screen_controller.dart';

import '../../../../core/utils/strings.dart';

class SplashScreenWidgetView
    extends WidgetView<SplashScreenController, SplashScreenControllerState> {
  const SplashScreenWidgetView(super.controllerState, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          splashName,
          textAlign: TextAlign.center,
          style: Styles.extraBoldTextWidgetStyle(size: 50),
        ),
      ),
    );
  }
}
