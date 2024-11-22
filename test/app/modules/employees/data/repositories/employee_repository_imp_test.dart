import 'package:desafio_mobile_betalent/app/core/domain/entities/either_of.dart';
import 'package:desafio_mobile_betalent/app/modules/employees/data/repositories/employee_repository_imp.dart';
import 'package:desafio_mobile_betalent/app/modules/employees/domain/entities/employee.dart';
import 'package:desafio_mobile_betalent/app/modules/employees/domain/entities/employee_failure.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../../mocks/mocks.mocks.dart';

void main() {
  late MockEmployeeDatasource mockEmployeeDatasource;
  late EmployeeRepositoryImp employeeRepositoryImp;

  setUp(() {
    mockEmployeeDatasource = MockEmployeeDatasource();
    employeeRepositoryImp =
        EmployeeRepositoryImp(employeeDatasource: mockEmployeeDatasource);
  });

  test('should return a list of employees', () async {
    when(mockEmployeeDatasource.getEmployees())
        .thenAnswer((_) async => <Employee>[]);

    final result = await employeeRepositoryImp.getEmployees();

    expect(result.isRight, true);
    expect(result.getOrElse(() => []), isA<List<Employee>>());
  });

  test('should return a empty list when there are no employees', () async {
    when(mockEmployeeDatasource.getEmployees())
        .thenAnswer((_) async => <Employee>[]);

    final result = await employeeRepositoryImp.getEmployees();

    expect(result.isRight, true);
    expect(result.getOrElse(() => []), []);
  });

  test('should return a failure when the datasource fails', () async {
    when(mockEmployeeDatasource.getEmployees())
        .thenThrow((_) async => EmployeeFailure(message: 'Error'));

    final result = await employeeRepositoryImp.getEmployees();

    expect(result.isLeft, true);
    expect(result.get(id, id), isA<EmployeeFailure>());
  });
}
