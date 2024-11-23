import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/domain/entities/usecase.dart';
import '../../../domain/usecases/get_employees.dart';
import 'employee_events.dart';
import 'employee_states.dart';

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
