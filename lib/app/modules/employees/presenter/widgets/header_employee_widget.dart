import 'package:badges/badges.dart' as badges;
import 'package:desafio_mobile_betalent/app/shared/components/app_icon.dart';
import 'package:flutter/material.dart';

import '../../../../core/domain/entities/app_assets.dart';
import '../../../../shared/domain/entities/app_theme_constants.dart';
import '../../../../shared/extensions/build_context_extension.dart';

class HeaderEmployeeWidget extends StatelessWidget {
  const HeaderEmployeeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        const CircleAvatar(
          radius: 22.5,
          child: Text('CG'),
        ),
        Ink(
          child: InkWell(
            onTap: () {
              Scaffold.of(context).openEndDrawer();
            },
            child: badges.Badge(
              badgeContent: Text(
                '02',
                style: context.textTheme.titleLarge?.copyWith(
                  fontSize: AppThemeConstants.h5FontSize,
                  color: context.colorScheme.onPrimary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              badgeStyle: badges.BadgeStyle(
                badgeColor: context.colorScheme.primary,
              ),
              child: const AppIcon(
                path: AppAssets.iconNotification,
                size: 32.0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
