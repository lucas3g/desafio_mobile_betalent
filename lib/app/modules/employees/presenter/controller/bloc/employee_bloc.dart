import 'package:desafio_mobile_betalent/app/core/domain/entities/usecase.dart';
import 'package:desafio_mobile_betalent/app/modules/employees/domain/usecases/get_employees.dart';
import 'package:desafio_mobile_betalent/app/modules/employees/presenter/controller/bloc/employee_events.dart';
import 'package:desafio_mobile_betalent/app/modules/employees/presenter/controller/bloc/employee_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class EmployeeBloc extends Bloc<EmployeeEvents, EmployeeStates> {
  final GetEmployees _getEmployees;

  EmployeeBloc({required GetEmployees getEmployees})
      : _getEmployees = getEmployees,
        super(EmployeeInitial()) {
    on<GetEmployeesEvent>(_getEmployeesEvent);
    on<FilterEmployeesEvent>(_filterEmployeesEvent);
  }

  Future<void> _getEmployeesEvent(
      GetEmployeesEvent event, Emitter<EmployeeStates> emit) async {
    emit(state.loading());

    final result = await _getEmployees(const NoArgs());

    result.get(
      (failure) => emit(state.error(message: failure.message)),
      (employees) => emit(state.loaded(employees: employees)),
    );
  }

  void _filterEmployeesEvent(
      FilterEmployeesEvent event, Emitter<EmployeeStates> emit) {
    emit(state.loaded(filter: event.filter));
  }
}
