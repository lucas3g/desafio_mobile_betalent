import 'dart:convert';

import 'package:injectable/injectable.dart';

import '../../../../core/data/clients/http/client_http.dart';
import '../../../../core/domain/entities/app_endpoints.dart';
import '../../../../core/domain/entities/response_entity.dart';
import '../../domain/entities/employee.dart';
import '../../domain/entities/employee_failure.dart';
import '../adapters/employee_adapter.dart';
import 'employee_datasource.dart';

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
