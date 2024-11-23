import 'package:desafio_mobile_betalent/app/shared/components/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared/components/spacer_height_widget.dart';
import '../../../../shared/components/text_form_field.dart';
import '../../../../shared/domain/entities/app_theme_constants.dart';
import '../../../../shared/extensions/build_context_extension.dart';
import '../controller/bloc/employee_bloc.dart';
import '../controller/bloc/employee_events.dart';
import '../controller/bloc/employee_states.dart';
import 'expansion_tile_card_employee_widget.dart';

class BodyEmployeeWidget extends StatefulWidget {
  final EmployeeBloc employeeBloc;
  const BodyEmployeeWidget({super.key, required this.employeeBloc});

  @override
  State<BodyEmployeeWidget> createState() => _BodyEmployeeWidgetState();
}

class _BodyEmployeeWidgetState extends State<BodyEmployeeWidget> {
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Funcionários',
            style: context.textTheme.titleLarge?.copyWith(
              fontSize: AppThemeConstants.h1FontSize,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SpacerHeight(),
          AppTextFormField(
            controller: _searchController,
            hint: 'Pesquisar',
            preffixIcon: Icon(
              Icons.search,
              color: context.colorScheme.secondary,
              size: 24,
            ),
            onChanged: (value) {
              widget.employeeBloc.add(
                FilterEmployeesEvent(value),
              );
            },
          ),
          const SpacerHeight(),
          Expanded(
            child: BlocBuilder<EmployeeBloc, EmployeeStates>(
              bloc: widget.employeeBloc,
              builder: (context, state) {
                if (state is EmployeeLoading) {
                  return const LoadingWidget();
                }

                if (state is EmployeeLoaded) {
                  final employees = state.filteredEmployees;

                  if (employees.isEmpty) {
                    return const Center(
                      child: Text('No employees found'),
                    );
                  }

                  return Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: context.colorScheme.onSurface.withOpacity(0.1),
                      ),
                      borderRadius: BorderRadius.circular(
                        AppThemeConstants.borderRadius,
                      ),
                    ),
                    child: Column(
                      children: [
                        Container(
                          height: 47,
                          padding: const EdgeInsets.all(
                            AppThemeConstants.mediumBorderRadius,
                          ),
                          decoration: BoxDecoration(
                            color: context.colorScheme.primaryContainer,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(
                                AppThemeConstants.borderRadius,
                              ),
                              topRight: Radius.circular(
                                AppThemeConstants.borderRadius,
                              ),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Foto',
                                    style:
                                        context.textTheme.titleLarge?.copyWith(
                                      fontSize: AppThemeConstants.h2FontSize,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: AppThemeConstants.spacingRegular24,
                                  ),
                                  Text(
                                    'Nome',
                                    style:
                                        context.textTheme.titleLarge?.copyWith(
                                      fontSize: AppThemeConstants.h2FontSize,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              const Expanded(
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      right: AppThemeConstants.halfPadding,
                                    ),
                                    child: Icon(
                                      Icons.circle,
                                      size: 10,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            padding: EdgeInsets.zero,
                            itemCount: employees.length,
                            itemBuilder: (context, index) {
                              final employee = employees[index];

                              return ExpansionTileCardEmployeeWidget(
                                employee: employee,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                }

                return const SizedBox();
              },
            ),
          )
        ],
      ),
    );
  }
}
