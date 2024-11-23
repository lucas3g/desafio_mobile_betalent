// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:desafio_mobile_betalent/app/shared/components/dashed_line.dart';
import 'package:desafio_mobile_betalent/app/shared/domain/entities/app_theme_constants.dart';
import 'package:desafio_mobile_betalent/app/shared/extensions/build_context_extension.dart';
import 'package:flutter/material.dart';

class ContentExpansionTileWidget extends StatelessWidget {
  final String title;
  final String value;

  const ContentExpansionTileWidget({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppThemeConstants.mediumPadding),
      child: Column(
        children: [
          Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  title,
                  style: context.textTheme.titleLarge?.copyWith(
                    fontSize: AppThemeConstants.h2FontSize,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  value,
                  style: context.textTheme.titleLarge?.copyWith(
                    fontSize: AppThemeConstants.h3FontSize,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.end,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 2,
          ),
          const DashedLine(
            dashWidth: 5,
            dashSpace: 3,
            thickness: 1,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
