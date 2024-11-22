sealed class EmployeeEvents {}

class GetEmployeesEvent extends EmployeeEvents {}

class FilterEmployeesEvent extends EmployeeEvents {
  final String filter;

  FilterEmployeesEvent(this.filter);
}
