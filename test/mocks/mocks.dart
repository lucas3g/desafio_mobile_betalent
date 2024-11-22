import 'package:desafio_mobile_betalent/app/core/data/clients/http/client_http.dart';
import 'package:desafio_mobile_betalent/app/modules/employees/data/datasources/employee_datasource.dart';
import 'package:desafio_mobile_betalent/app/modules/employees/domain/repositories/employee_repository.dart';
import 'package:desafio_mobile_betalent/app/modules/employees/domain/usecases/get_employees.dart';
import 'package:dio/dio.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks(<Type>[
  //[GLOBAL]
  Dio,
  ClientHttp,

  //[EMPLOYEES]
  EmployeeDatasource,
  EmployeeRepository,
  GetEmployees,
])
class Mocks {
  static final Mocks _instance = Mocks._internal();

  factory Mocks() => _instance;

  Mocks._internal();
}
