import 'package:desafio_mobile_betalent/app/core/domain/entities/app_equatable.dart';

import '../../../../core/domain/entities/failure.dart';

class EmployeeFailure extends AppFailure with AppEquatable {
  EmployeeFailure({String? message})
      : super(message ?? 'Employee error message');

  static unExpected() => EmployeeFailure(message: 'Unexpected error');

  @override
  List<Object?> get props => [message];
}
