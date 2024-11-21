import 'package:desafio_mobile_betalent/app/core/domain/entities/either_of.dart';
import 'package:desafio_mobile_betalent/app/modules/employees/data/datasources/employee_datasource.dart';
import 'package:desafio_mobile_betalent/app/modules/employees/domain/entities/employee.dart';
import 'package:desafio_mobile_betalent/app/modules/employees/domain/entities/employee_failure.dart';
import 'package:desafio_mobile_betalent/app/modules/employees/domain/repositories/employee_repository.dart';
import 'package:injectable/injectable.dart';

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
