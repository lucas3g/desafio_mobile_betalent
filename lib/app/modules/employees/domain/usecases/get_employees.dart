import 'package:desafio_mobile_betalent/app/core/domain/entities/either_of.dart';
import 'package:desafio_mobile_betalent/app/core/domain/entities/failure.dart';
import 'package:desafio_mobile_betalent/app/core/domain/entities/usecase.dart';
import 'package:desafio_mobile_betalent/app/modules/employees/domain/entities/employee.dart';
import 'package:desafio_mobile_betalent/app/modules/employees/domain/repositories/employee_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetEmployees implements UseCase<List<Employee>, NoArgs> {
  final EmployeeRepository _repository;

  GetEmployees({required EmployeeRepository repository})
      : _repository = repository;

  @override
  Future<EitherOf<AppFailure, List<Employee>>> call(NoArgs args) async {
    return await _repository.getEmployees();
  }
}
