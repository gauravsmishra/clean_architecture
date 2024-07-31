import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../core/styles/styles.dart';
import '../core/theme/app_colors.dart';
import '../core/utils/common_widgets.dart';

Future<bool> checkInternetConnectivity() async {
  var connectivityResult = await Connectivity().checkConnectivity();
  if (connectivityResult.contains(ConnectivityResult.none)) {
    return false;
  } else {
    return true;
  }
}

bool isShowingInternetStatusSnackBar = false;

void showInternetStatusSnackBar(BuildContext context, bool isMobileConnectivity,
    [RequestOptions? options, RequestInterceptorHandler? requestHandler]) {
  if (!isShowingInternetStatusSnackBar) {
    isShowingInternetStatusSnackBar = true;
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              vSpace(15),
              const Icon(
                Icons.signal_wifi_off,
                size: 40,
                color: AppColors.redBgColor,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                child: Text(
                    isMobileConnectivity
                        ? "To access the Movies Data. Please use WI-Fi Indian Government had blocked TMDM on mobile internet"
                        : "No internet connection. Please check your connection and try again.",
                    textAlign: TextAlign.center,
                    style: Styles.mediumTextWidgetStyle(size: 16)),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors
                      .redBgColor, // Set the background color of the button.
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                  requestHandler?.next(options!);
                },
                child: Text(
                  "OK",
                  style: Styles.mediumTextWidgetStyle(
                      size: 16, color: AppColors.whiteColor),
                ),
              ),
            ],
          ),
        );
      },
    ).then((reason) => isShowingInternetStatusSnackBar = false);
  }
}

Widget noInternetWidget(BuildContext context) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        vSpace(15),
        const Icon(
          Icons.signal_wifi_off,
          size: 40,
          color: AppColors.redBgColor,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
          child: Text(
              "No internet connection. Please check your connection and try again.",
              textAlign: TextAlign.center,
              style: Styles.mediumTextWidgetStyle(size: 16)),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor:
                AppColors.redBgColor, // Set the background color of the button.
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            "OK",
            style: Styles.mediumTextWidgetStyle(
                size: 16, color: AppColors.whiteColor),
          ),
        ),
      ],
    ),
  );
}
