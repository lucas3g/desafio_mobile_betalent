import 'package:desafio_mobile_betalent/app/core/domain/entities/either_of.dart';
import 'package:desafio_mobile_betalent/app/core/domain/entities/usecase.dart';
import 'package:desafio_mobile_betalent/app/modules/employees/domain/entities/employee.dart';
import 'package:desafio_mobile_betalent/app/modules/employees/domain/usecases/get_employees.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

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
        .thenAnswer((_) async => resolve(<Employee>[]));

    final result = await getEmployees(const NoArgs());

    expect(result.isRight, true);
    expect(result.getOrElse(() => []), isA<List<Employee>>());
  });
}
