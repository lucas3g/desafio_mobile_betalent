import 'package:desafio_mobile_betalent/app/core/domain/entities/response_entity.dart';
import 'package:desafio_mobile_betalent/app/modules/employees/data/datasources/employee_datasource_imp.dart';
import 'package:desafio_mobile_betalent/app/modules/employees/domain/entities/employee.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../../fixtures/employee_fixtures.dart';
import '../../../../../mocks/mocks.mocks.dart';

void main() {
  late MockClientHttp mockClientHttp;
  late EmployeeDatasourceImp employeeDatasourceImp;

  setUp(() {
    mockClientHttp = MockClientHttp();
    employeeDatasourceImp = EmployeeDatasourceImp(clientHttp: mockClientHttp);
  });

  test('should return a list of employees', () async {
    when(mockClientHttp.get(any)).thenAnswer(
      (_) async => HttpResponseEntity<String>(
        statusCode: 200,
        data: EmployeeFixtures.employeesJson(),
      ),
    );

    final result = await employeeDatasourceImp.getEmployees();

    expect(result, isA<List<Employee>>());
  });

  test('should return a empty list when there are no employees', () async {
    when(mockClientHttp.get(any)).thenAnswer(
      (_) async => HttpResponseEntity<String>(
        statusCode: 200,
        data: '[]',
      ),
    );

    final result = await employeeDatasourceImp.getEmployees();

    expect(result, []);
  });

  test('should return a failure when the datasource fails', () async {
    when(mockClientHttp.get(any)).thenThrow(Exception('Error'));

    expect(() async => await employeeDatasourceImp.getEmployees(),
        throwsA(isA<Exception>()));
  });
}
