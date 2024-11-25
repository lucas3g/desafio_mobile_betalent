part of 'employee_bloc.dart';

sealed class EmployeeEvents with AppEquatable {
  const EmployeeEvents();
}

class GetEmployeesEvent extends EmployeeEvents {
  @override
  List<Object?> get props => [];
}

class FilterEmployeesEvent extends EmployeeEvents {
  final String filter;

  FilterEmployeesEvent(this.filter);

  @override
  List<Object?> get props => [filter];
}
