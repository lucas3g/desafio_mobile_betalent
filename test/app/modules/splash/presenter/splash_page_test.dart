import 'package:desafio_mobile_betalent/app/core/domain/entities/either_of.dart';
import 'package:desafio_mobile_betalent/app/core/domain/entities/named_routes.dart';
import 'package:desafio_mobile_betalent/app/core/domain/entities/usecase.dart';
import 'package:desafio_mobile_betalent/app/core/routes/app_routes.dart';
import 'package:desafio_mobile_betalent/app/core/routes/domain/entities/custom_transition.dart';
import 'package:desafio_mobile_betalent/app/core/routes/domain/entities/custom_transition_type.dart';
import 'package:desafio_mobile_betalent/app/di/dependency_injection.dart';
import 'package:desafio_mobile_betalent/app/modules/employees/presenter/controller/bloc/employee_bloc.dart';
import 'package:desafio_mobile_betalent/app/modules/splash/presenter/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../fixtures/employee_fixtures.dart';
import '../../../../mocks/mocks.mocks.dart';

void main() {
  late Widget splashPage;
  late MockGetEmployees mockGetEmployees;
  late EmployeeBloc employeeBloc;

  setUp(() {
    mockGetEmployees = MockGetEmployees();
    employeeBloc = EmployeeBloc(getEmployees: mockGetEmployees);

    if (getIt.isRegistered<EmployeeBloc>()) {
      getIt.unregister<EmployeeBloc>();
    }

    getIt.registerFactory<EmployeeBloc>(() => employeeBloc);

    splashPage = MaterialApp(
      home: const SplashPage(),
      initialRoute: NamedRoutes.splash.route,
      onGenerateRoute: CustomNavigator(
        generateAnimation: (settings) {
          return CustomTransition(
            transitionType: CustomTransitionType.fade,
            duration: const Duration(milliseconds: 200),
          );
        },
      ).onGenerateRoute,
    );
  });

  testWidgets('should render a splash page', (tester) async {
    when(mockGetEmployees(const NoArgs())).thenAnswer(
      (_) async => resolve(EmployeeFixtures.employees()),
    );

    await tester.pumpWidget(splashPage);
    await tester.pump(const Duration(seconds: 2));

    expect(find.byType(Image), findsOneWidget);
  });

  testWidgets('should navigate to the employees page', (tester) async {
    when(mockGetEmployees(const NoArgs())).thenAnswer(
      (_) async => resolve(EmployeeFixtures.employees()),
    );

    await tester.pumpWidget(splashPage);
    await tester.pump(const Duration(seconds: 2));
    await tester.pump(const Duration(milliseconds: 350));

    expect(find.text('Funcionários'), findsOneWidget);
  });
}
