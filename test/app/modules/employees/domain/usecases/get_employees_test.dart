import 'package:desafio_mobile_betalent/app/core/domain/entities/either_of.dart';
import 'package:desafio_mobile_betalent/app/core/domain/entities/usecase.dart';
import 'package:desafio_mobile_betalent/app/modules/employees/domain/entities/employee.dart';
import 'package:desafio_mobile_betalent/app/modules/employees/domain/entities/employee_failure.dart';
import 'package:desafio_mobile_betalent/app/modules/employees/domain/usecases/get_employees.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../../fixtures/employee_fixtures.dart';
import '../../../../../mocks/mocks.mocks.dart';

void main() {
  late MockEmployeeRepository mockEmployeeRepository;
  late GetEmployees getEmployees;

  setUp(() {
    mockEmployeeRepository = MockEmployeeRepository();
    getEmployees = GetEmployees(repository: mockEmployeeRepository);
  });

  test('should return a list of employees', () async {
    when(mockEmployeeRepository.getEmployees())
        .thenAnswer((_) async => resolve(EmployeeFixtures.employees()));

    final result = await getEmployees(const NoArgs());

    expect(result.isRight, true);
    expect(result.getOrElse(() => []), isA<List<Employee>>());
  });

  test('should return a empty list when there are no employees', () async {
    when(mockEmployeeRepository.getEmployees())
        .thenAnswer((_) async => resolve([]));

    final result = await getEmployees(const NoArgs());

    expect(result.isRight, true);
    expect(result.getOrElse(() => []), []);
  });

  test('should return a failure when the repository fails', () async {
    when(mockEmployeeRepository.getEmployees())
        .thenAnswer((_) async => reject(EmployeeFailure(message: 'Error')));

    final result = await getEmployees(const NoArgs());

    expect(result.isLeft, true);
    expect(result.get(id, id), isA<EmployeeFailure>());
  });
}
