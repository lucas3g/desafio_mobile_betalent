import 'dart:async';

import 'package:flutter/material.dart';

import '../../../di/dependency_injection.dart';
import '../../../shared/components/app_snackbar.dart';
import '../../../shared/components/spacer_height_widget.dart';
import '../../../shared/domain/entities/app_theme_constants.dart';
import 'controller/bloc/employee_bloc.dart';
import 'widgets/body_employee_widget.dart';
import 'widgets/header_employee_widget.dart';
import 'widgets/notification_drawer_widget.dart';

class EmployeesPage extends StatefulWidget {
  const EmployeesPage({super.key});

  @override
  State<EmployeesPage> createState() => _EmployeesPageState();
}

class _EmployeesPageState extends State<EmployeesPage> {
  final EmployeeBloc employeeBloc = getIt<EmployeeBloc>();

  late StreamSubscription<EmployeeStates>? _sub;

  void _getEmployees() {
    employeeBloc.add(GetEmployeesEvent());
  }

  void _listenStates() {
    _sub = employeeBloc.stream.listen((state) {
      if (state is EmployeeError) {
        if (mounted) {
          showAppSnackbar(
            context,
            title: 'Ops...',
            message: state.message,
            type: TypeSnack.error,
          );
        }
      }
    });
  }

  @override
  void initState() {
    super.initState();

    _getEmployees();

    _listenStates();
  }

  @override
  void dispose() {
    _sub?.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const NotificationDrawerWidget(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppThemeConstants.padding),
          child: Column(
            children: <Widget>[
              const HeaderEmployeeWidget(),
              const SpacerHeight(),
              BodyEmployeeWidget(employeeBloc: employeeBloc),
            ],
          ),
        ),
      ),
    );
  }
}
