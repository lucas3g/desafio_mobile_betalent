import 'dart:convert';

import 'package:desafio_mobile_betalent/app/core/data/clients/http/client_http.dart';
import 'package:desafio_mobile_betalent/app/core/domain/entities/app_endpoints.dart';
import 'package:desafio_mobile_betalent/app/core/domain/entities/response_entity.dart';
import 'package:desafio_mobile_betalent/app/modules/employees/data/adapters/employee_adapter.dart';
import 'package:desafio_mobile_betalent/app/modules/employees/data/datasources/employee_datasource.dart';
import 'package:desafio_mobile_betalent/app/modules/employees/domain/entities/employee.dart';
import 'package:desafio_mobile_betalent/app/modules/employees/domain/entities/employee_failure.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: EmployeeDatasource)
class EmployeeDatasourceImp implements EmployeeDatasource {
  final ClientHttp _clientHttp;

  EmployeeDatasourceImp({required ClientHttp clientHttp})
      : _clientHttp = clientHttp;

  @override
  Future<List<Employee>> getEmployees() async {
    try {
      final HttpResponseEntity<String> response =
          await _clientHttp.get(AppEndpoints.employees.path);

      if (response.statusCode != 200) {
        throw EmployeeFailure(message: 'Error to get employees');
      }

      if (response.data == null) {
        throw EmployeeFailure(message: 'Error to get employees');
      }

      final List<Map<String, dynamic>> json =
          List.from(jsonDecode(response.data!));

      final List<Employee> employees =
          json.map(EmployeeAdapter.fromJson).toList();

      return employees;
    } catch (e) {
      rethrow;
    }
  }
}
