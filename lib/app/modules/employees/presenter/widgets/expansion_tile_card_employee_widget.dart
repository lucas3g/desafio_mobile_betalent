import 'package:desafio_mobile_betalent/app/modules/employees/presenter/widgets/content_expansion_tile_widget.dart';
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
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: context.colorScheme.onSurface.withOpacity(0.1),
          ),
        ),
      ),
      child: Theme(
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
              Expanded(
                child: Text(
                  employee.name.value,
                  style: context.textTheme.titleLarge?.copyWith(
                    fontSize: AppThemeConstants.h3FontSize,
                    fontWeight: FontWeight.w400,
                  ),
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
                  ContentExpansionTileWidget(
                    title: 'Cargo',
                    value: employee.job.value,
                  ),
                  ContentExpansionTileWidget(
                    title: 'Data de admissão',
                    value: employee.admissionDate.value.formatDate(),
                  ),
                  ContentExpansionTileWidget(
                    title: 'Telefone',
                    value: employee.phone.value.formatPhone(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
