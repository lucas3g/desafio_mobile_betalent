import '../../domain/entities/employee.dart';

abstract class EmployeeDatasource {
  Future<List<Employee>> getEmployees();
}
