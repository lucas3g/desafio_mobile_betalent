part of 'employee_bloc.dart';

sealed class EmployeeStates {
  final List<Employee> employees;
  final String filter;

  EmployeeStates({required this.employees, required this.filter});

  EmployeeInitial initial() => EmployeeInitial();

  EmployeeLoading loading() => EmployeeLoading(
        employees: employees,
        filter: filter,
      );

  EmployeeLoaded loaded({List<Employee>? employees, String? filter}) =>
      EmployeeLoaded(
        employees: employees ?? this.employees,
        filter: filter ?? this.filter,
      );

  EmployeeError error({required String message}) => EmployeeError(
        message: message,
        employees: employees,
        filter: filter,
      );

  List<Employee> get filteredEmployees {
    if (filter.isEmpty) {
      return employees;
    }

    return employees
        .where((employee) =>
            employee.name.value.toLowerCase().contains(filter.toLowerCase()) ||
            employee.job.value.toLowerCase().contains(filter.toLowerCase()) ||
            employee.phone.value.contains(filter))
        .toList();
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EmployeeStates && runtimeType == other.runtimeType;

  @override
  int get hashCode => 0;
}

class EmployeeInitial extends EmployeeStates {
  EmployeeInitial() : super(employees: [], filter: '');

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EmployeeInitial && runtimeType == other.runtimeType;

  @override
  int get hashCode => 0;
}

class EmployeeLoading extends EmployeeStates {
  EmployeeLoading({required super.employees, required super.filter});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EmployeeLoading && runtimeType == other.runtimeType;

  @override
  int get hashCode => 0;
}

class EmployeeLoaded extends EmployeeStates {
  EmployeeLoaded({required super.employees, required super.filter});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EmployeeLoaded && runtimeType == other.runtimeType;

  @override
  int get hashCode => 0;
}

class EmployeeError extends EmployeeStates {
  final String message;

  EmployeeError({
    required this.message,
    required super.employees,
    required super.filter,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EmployeeError &&
          runtimeType == other.runtimeType &&
          message == other.message;

  @override
  int get hashCode => 0;
}
