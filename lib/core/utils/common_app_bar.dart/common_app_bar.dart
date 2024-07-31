import 'dart:io';

import 'package:flutter/material.dart';
import 'package:imdb_poc/core/theme/app_colors.dart';
import '../../styles/styles.dart';

class CommonAppBar {
  /// Appbar with rounded bottom corners

  static PreferredSize backIconAppbar(
    BuildContext context, {
    /// Show app log when true
    showAppLogo = false,

    /// Show backIcon when true
    showBackIcon = false,

    /// Pass title string if want to show the title in App bar
    String? title,

    /// Pass Background color
    Color? backgroundColor,

    /// Pass backi icon color
    Color? backIconColor,

    /// Pass backi icon color
    bool? centerTitle = true,
  }) {
    return PreferredSize(
      preferredSize: Size.fromHeight(
          (title == null && !showBackIcon && !showAppLogo) ? 50 : 0),
      child: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        leading: showBackIcon
            ? InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Icon(
                      Platform.isAndroid
                          ? Icons.arrow_back
                          : Icons.arrow_back_ios,
                      color: backIconColor ?? AppColors.textBlackColor,
                    )),
              )
            : null,
        leadingWidth: 79,
        centerTitle: centerTitle,
        title: title != null
            ? Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Styles.boldTextWidgetStyle(size: 18),
              )
            : null,
      ),
    );
  }
}
