import 'package:injectable/injectable.dart';

import '../../../../core/domain/entities/either_of.dart';
import '../../../../core/domain/entities/failure.dart';
import '../../../../core/domain/entities/usecase.dart';
import '../entities/employee.dart';
import '../repositories/employee_repository.dart';

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
