import 'package:injectable/injectable.dart';

import '../../../../core/domain/entities/either_of.dart';
import '../../domain/entities/employee.dart';
import '../../domain/entities/employee_failure.dart';
import '../../domain/repositories/employee_repository.dart';
import '../datasources/employee_datasource.dart';

@Injectable(as: EmployeeRepository)
class EmployeeRepositoryImp implements EmployeeRepository {
  final EmployeeDatasource _employeeDatasource;

  EmployeeRepositoryImp({required EmployeeDatasource employeeDatasource})
      : _employeeDatasource = employeeDatasource;

  @override
  Future<EitherOf<EmployeeFailure, List<Employee>>> getEmployees() async {
    try {
      final List<Employee> employees = await _employeeDatasource.getEmployees();

      return resolve(employees);
    } on EmployeeFailure catch (e) {
      return reject(e);
    } catch (e) {
      return reject(EmployeeFailure.unExpected());
    }
  }
}
