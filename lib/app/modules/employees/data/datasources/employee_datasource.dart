import 'package:desafio_mobile_betalent/app/modules/employees/domain/entities/employee.dart';

abstract class EmployeeDatasource {
  Future<List<Employee>> getEmployees();
}
