import 'package:desafio_mobile_betalent/app/modules/employees/presenter/controller/bloc/employee_bloc.dart';
import 'package:desafio_mobile_betalent/app/modules/employees/presenter/controller/bloc/employee_states.dart';
import 'package:desafio_mobile_betalent/app/shared/components/spacer_height_widget.dart';
import 'package:desafio_mobile_betalent/app/shared/components/spacer_width.dart';
import 'package:desafio_mobile_betalent/app/shared/domain/entities/app_theme_constants.dart';
import 'package:desafio_mobile_betalent/app/shared/extensions/build_context_extension.dart';
import 'package:desafio_mobile_betalent/app/shared/utils/formatters.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BodyEmployeeWidget extends StatelessWidget {
  final EmployeeBloc employeeBloc;
  const BodyEmployeeWidget({super.key, required this.employeeBloc});

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
              fontWeight: FontWeight.w500,
            ),
          ),
          const SpacerHeight(),
          Expanded(
            child: BlocBuilder<EmployeeBloc, EmployeeStates>(
              bloc: employeeBloc,
              builder: (context, state) {
                if (state is EmployeeLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (state is EmployeeLoaded) {
                  final employees = state.employees;

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
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text('Foto'),
                                  SpacerWidth(),
                                  Text('Nome'),
                                ],
                              ),
                              Text('.'),
                            ],
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            padding: EdgeInsets.zero,
                            itemCount: employees.length,
                            itemBuilder: (context, index) {
                              final employee = employees[index];

                              return Container(
                                decoration: BoxDecoration(
                                  border: employees.length != index + 1
                                      ? Border(
                                          bottom: BorderSide(
                                            color: context.colorScheme.onSurface
                                                .withOpacity(0.1),
                                          ),
                                        )
                                      : null,
                                ),
                                child: Theme(
                                  data: Theme.of(context).copyWith(
                                    dividerColor: Colors.transparent,
                                  ),
                                  child: ExpansionTile(
                                    tilePadding: const EdgeInsets.all(
                                      AppThemeConstants.mediumBorderRadius,
                                    ),
                                    leading: CircleAvatar(
                                      radius: 18,
                                      backgroundImage:
                                          NetworkImage(employee.image.value),
                                    ),
                                    title: Text(employee.name.value),
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          const Text('Cargo'),
                                          Text(employee.job.value),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          const Text('Data de admissão'),
                                          Text(employee.admissionDate.value
                                              .formatDate()),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          const Text('Telefone'),
                                          Text(employee.phone.value
                                              .formatPhone()),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
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
