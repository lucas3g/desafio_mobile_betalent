part of 'employee_bloc.dart';

sealed class EmployeeEvents {
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EmployeeEvents && runtimeType == other.runtimeType;

  @override
  int get hashCode => 0;
}

class GetEmployeesEvent extends EmployeeEvents {
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GetEmployeesEvent && runtimeType == other.runtimeType;

  @override
  int get hashCode => 0;
}

class FilterEmployeesEvent extends EmployeeEvents {
  final String filter;

  FilterEmployeesEvent(this.filter);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FilterEmployeesEvent && filter == other.filter;

  @override
  int get hashCode => filter.hashCode;
}
