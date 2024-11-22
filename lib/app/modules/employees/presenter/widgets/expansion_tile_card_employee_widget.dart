import 'package:desafio_mobile_betalent/app/shared/components/dashed_line.dart';
import 'package:desafio_mobile_betalent/app/shared/components/spacer_height_widget.dart';
import 'package:desafio_mobile_betalent/app/shared/domain/entities/app_theme_constants.dart';
import 'package:desafio_mobile_betalent/app/shared/extensions/build_context_extension.dart';
import 'package:desafio_mobile_betalent/app/shared/utils/formatters.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/employee.dart';

class ExpansionTileCardEmployeeWidget extends StatelessWidget {
  final Employee employee;

  const ExpansionTileCardEmployeeWidget({
    super.key,
    required this.employee,
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        dividerColor: Colors.transparent,
      ),
      child: ExpansionTile(
        collapsedIconColor: context.colorScheme.primary,
        tilePadding: const EdgeInsets.all(
          AppThemeConstants.mediumBorderRadius,
        ),
        title: Row(
          children: [
            CircleAvatar(
              radius: 18,
              backgroundImage: NetworkImage(employee.image.value),
            ),
            const SizedBox(width: AppThemeConstants.spacingRegular20),
            Text(
              employee.name.value,
              style: context.textTheme.titleLarge?.copyWith(
                fontSize: AppThemeConstants.h3FontSize,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: AppThemeConstants.mediumPadding,
              right: AppThemeConstants.padding,
              bottom: AppThemeConstants.padding,
            ),
            child: Column(
              children: [
                const SpacerHeight(),
                _buildContentExpasionTile(
                  context,
                  'Cargo',
                  employee.job.value,
                ),
                _buildContentExpasionTile(
                  context,
                  'Data de admissão',
                  employee.admissionDate.value.formatDate(),
                ),
                _buildContentExpasionTile(
                  context,
                  'Telefone',
                  employee.phone.value.formatPhone(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContentExpasionTile(
      BuildContext context, String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppThemeConstants.mediumPadding),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                title,
                style: context.textTheme.titleLarge?.copyWith(
                  fontSize: AppThemeConstants.h2FontSize,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                value,
                style: context.textTheme.titleLarge?.copyWith(
                  fontSize: AppThemeConstants.h3FontSize,
                  fontWeight: FontWeight.w500,
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
