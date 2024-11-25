import 'package:bloc_test/bloc_test.dart';
import 'package:desafio_mobile_betalent/app/core/domain/entities/either_of.dart';
import 'package:desafio_mobile_betalent/app/core/domain/entities/usecase.dart';
import 'package:desafio_mobile_betalent/app/modules/employees/domain/entities/employee.dart';
import 'package:desafio_mobile_betalent/app/modules/employees/domain/entities/employee_failure.dart';
import 'package:desafio_mobile_betalent/app/modules/employees/presenter/controller/bloc/employee_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../../../fixtures/employee_fixtures.dart';
import '../../../../../../mocks/mocks.mocks.dart';

void main() {
  late MockGetEmployees mockGetEmployees;
  late EmployeeBloc bloc;

  setUp(() {
    mockGetEmployees = MockGetEmployees();
    bloc = EmployeeBloc(getEmployees: mockGetEmployees);
  });

  blocTest<EmployeeBloc, EmployeeStates>(
    'Should emit [EmployeeLoading, EmployeeLoaded] when usecase is called',
    setUp: () {
      when(mockGetEmployees(const NoArgs()))
          .thenAnswer((_) async => resolve(EmployeeFixtures.employees()));
    },
    build: () => bloc,
    act: (bloc) => bloc.add(GetEmployeesEvent()),
    expect: () => [
      EmployeeLoading(
        employees: <Employee>[],
        filter: '',
      ),
      EmployeeLoaded(employees: EmployeeFixtures.employees(), filter: '')
    ],
  );

  blocTest<EmployeeBloc, EmployeeStates>(
    'Should emit [EmployeeLoading, EmployeeError] when usecase is called',
    setUp: () {
      when(mockGetEmployees(const NoArgs()))
          .thenAnswer((_) async => reject(EmployeeFailure(message: 'Error')));
    },
    build: () => bloc,
    act: (bloc) => bloc.add(GetEmployeesEvent()),
    expect: () => [
      EmployeeLoading(
        employees: <Employee>[],
        filter: '',
      ),
      EmployeeError(
        message: 'Error',
        employees: <Employee>[],
        filter: '',
      )
    ],
  );
}
