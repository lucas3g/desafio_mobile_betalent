import 'package:flutter/material.dart';

import '../domain/entities/app_theme_constants.dart';

class CustomAppBar extends AppBar {
  CustomAppBar({
    super.key,
    required Widget title,
    Widget? leading,
    Widget? flexibleSpace,
    List<Widget>? actions,
  }) : super(
          leading: leading,
          actions: actions,
          title: title,
          flexibleSpace: flexibleSpace,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(AppThemeConstants.largeBorderRadius),
              bottomRight: Radius.circular(AppThemeConstants.largeBorderRadius),
            ),
          ),
        );
}
