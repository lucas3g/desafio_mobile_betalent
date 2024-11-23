import '../../../../core/domain/entities/either_of.dart';
import '../entities/employee.dart';
import '../entities/employee_failure.dart';

abstract class EmployeeRepository {
  Future<EitherOf<EmployeeFailure, List<Employee>>> getEmployees();
}
