import '../../../../core/domain/entities/failure.dart';

class EmployeeFailure extends AppFailure {
  EmployeeFailure({String? message})
      : super(message ?? 'Employee error message');

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is EmployeeFailure && other.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}
