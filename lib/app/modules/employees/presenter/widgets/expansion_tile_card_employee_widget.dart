import 'package:flutter/material.dart';

import '../../../../shared/components/spacer_height_widget.dart';
import '../../../../shared/domain/entities/app_theme_constants.dart';
import '../../../../shared/extensions/build_context_extension.dart';
import '../../../../shared/utils/formatters.dart';
import '../../domain/entities/employee.dart';
import 'content_expansion_tile_widget.dart';

class ExpansionTileCardEmployeeWidget extends StatefulWidget {
  final Employee employee;

  const ExpansionTileCardEmployeeWidget({
    super.key,
    required this.employee,
  });

  @override
  State<ExpansionTileCardEmployeeWidget> createState() =>
      _ExpansionTileCardEmployeeWidgetState();
}

class _ExpansionTileCardEmployeeWidgetState
    extends State<ExpansionTileCardEmployeeWidget> {
  bool _expanded = false;

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
          trailing: AnimatedRotation(
            turns: _expanded ? 0.5 : 0.0,
            duration: const Duration(milliseconds: 200),
            child: const Icon(
              Icons.keyboard_arrow_down,
              size: 32,
            ),
          ),
          onExpansionChanged: (bool expanding) {
            setState(() {
              _expanded = expanding;
            });
          },
          title: Row(
            children: [
              CircleAvatar(
                radius: 18,
                backgroundImage: NetworkImage(widget.employee.image.value),
              ),
              const SizedBox(width: AppThemeConstants.spacingRegular20),
              Expanded(
                child: Text(
                  widget.employee.name.value,
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
                    value: widget.employee.job.value,
                  ),
                  ContentExpansionTileWidget(
                    title: 'Data de admissão',
                    value: widget.employee.admissionDate.value.formatDate(),
                  ),
                  ContentExpansionTileWidget(
                    title: 'Telefone',
                    value: widget.employee.phone.value.formatPhone(),
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
