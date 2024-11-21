import 'package:desafio_mobile_betalent/app/core/domain/entities/either_of.dart';
import 'package:desafio_mobile_betalent/app/modules/employees/domain/entities/employee.dart';
import 'package:desafio_mobile_betalent/app/modules/employees/domain/entities/employee_failure.dart';

abstract class EmployeeRepository {
  Future<EitherOf<EmployeeFailure, List<Employee>>> getEmployees();
}
