import 'dart:io';

import 'package:desafio_mobile_betalent/app/core/domain/entities/either_of.dart';
import 'package:desafio_mobile_betalent/app/core/domain/entities/usecase.dart';
import 'package:desafio_mobile_betalent/app/di/dependency_injection.dart';
import 'package:desafio_mobile_betalent/app/modules/employees/domain/entities/employee_failure.dart';
import 'package:desafio_mobile_betalent/app/modules/employees/presenter/controller/bloc/employee_bloc.dart';
import 'package:desafio_mobile_betalent/app/modules/employees/presenter/employees_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../fixtures/employee_fixtures.dart';
import '../../../../mocks/mocks.mocks.dart';

void main() {
  late Widget employeesPage;

  late MockGetEmployees mockGetEmployees;
  late EmployeeBloc employeeBloc;

  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    HttpOverrides.global = null;

    mockGetEmployees = MockGetEmployees();
    employeeBloc = EmployeeBloc(getEmployees: mockGetEmployees);

    if (getIt.isRegistered<EmployeeBloc>()) {
      getIt.unregister<EmployeeBloc>();
    }

    getIt.registerFactory<EmployeeBloc>(() => employeeBloc);

    employeesPage = const MaterialApp(
      home: EmployeesPage(),
    );

    clearInteractions(mockGetEmployees);
  });

  testWidgets('should render Employees Page', (tester) async {
    await tester.runAsync(() async {
      when(mockGetEmployees(const NoArgs())).thenAnswer(
        (_) async => resolve(EmployeeFixtures.employees()),
      );

      await tester.pumpWidget(employeesPage);
      await tester.pump();

      verify(mockGetEmployees(const NoArgs())).called(1);

      expect(find.byType(CircleAvatar), findsAtLeast(2));
      expect(find.byType(Image), findsOneWidget);
      expect(find.text('Funcionários'), findsOneWidget);
      expect(find.byType(TextField), findsOneWidget);
      expect(find.byType(ListView), findsOneWidget);
      expect(find.byType(ExpansionTile), findsAny);
    });
  });

  testWidgets('should search employee by name', (tester) async {
    await tester.runAsync(() async {
      when(mockGetEmployees(const NoArgs())).thenAnswer(
        (_) async => resolve(EmployeeFixtures.employees()),
      );

      await tester.pumpWidget(employeesPage);
      await tester.pump();

      expect(
        find.descendant(
          of: find.byType(ExpansionTile),
          matching: find.byWidgetPredicate(
              (Widget widget) => widget is Text && widget.data == 'Roberto'),
        ),
        findsOneWidget,
      );

      final Finder inputsFinder = find.byType(TextFormField);
      expect(inputsFinder, findsOneWidget);

      await tester.enterText(inputsFinder, 'João');
      await tester.pump();

      expect(
        find.descendant(
          of: find.byType(ExpansionTile),
          matching: find.byWidgetPredicate(
              (Widget widget) => widget is Text && widget.data == 'João'),
        ),
        findsOne,
      );

      // GARENTEED THAT THE OTHER EMPLOYEES ARE NOT SHOWING
      expect(
        find.descendant(
          of: find.byType(ExpansionTile),
          matching: find.byWidgetPredicate(
              (Widget widget) => widget is Text && widget.data == 'Roberto'),
        ),
        findsNothing,
      );
    });
  });

  testWidgets(
      'should render "CircularProgressiveIndicator" when call "GetEmployees"',
      (tester) async {
    await tester.runAsync(() async {
      when(mockGetEmployees(const NoArgs())).thenAnswer(
        (_) async {
          await Future.delayed(const Duration(seconds: 1));

          return resolve(EmployeeFixtures.employees());
        },
      );

      await tester.pumpWidget(employeesPage);
      await tester.pump();

      expect(find.byType(CircularProgressIndicator), findsOneWidget);

      await Future.delayed(const Duration(seconds: 1));
      await tester.pump();

      expect(find.byType(CircularProgressIndicator), findsNothing);

      // GARENTEED THAT THE EMPLOYEES ARE SHOWING
      expect(find.byType(ExpansionTile), findsWidgets);
    });
  });

  testWidgets('should render "No employees found" when no employees are found',
      (tester) async {
    await tester.runAsync(() async {
      when(mockGetEmployees(const NoArgs())).thenAnswer(
        (_) async => resolve([]),
      );

      await tester.pumpWidget(employeesPage);
      await tester.pump();

      expect(find.text('No employees found'), findsOneWidget);
    });
  });

  testWidgets('should render "Error" when call "GetEmployees"', (tester) async {
    await tester.runAsync(() async {
      when(mockGetEmployees(const NoArgs())).thenAnswer(
        (_) async => reject(EmployeeFailure(message: 'Error')),
      );

      await tester.pumpWidget(employeesPage);

      // WAITING FOR THE SNACKBAR TO SHOW
      await tester.pump(Durations.medium1);
      await tester.pump(Durations.medium1);
      await tester.pump(Durations.medium1);
      await tester.pump(Durations.medium1);

      expect(
        find.descendant(
          of: find.byType(SnackBar),
          matching: find.byWidgetPredicate(
              (Widget widget) => widget is Text && widget.data == 'Error'),
        ),
        findsOneWidget,
      );
    });
  });
}
