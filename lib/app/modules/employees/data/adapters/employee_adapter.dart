import '../../domain/entities/employee.dart';

class EmployeeAdapter {
  static Employee fromJson(Map<String, dynamic> json) {
    return Employee(
      id: json['id'] as int,
      name: json['name'] as String,
      job: json['job'] as String,
      admissionDate: DateTime.parse(json['admission_date'] as String),
      phone: json['phone'] as String,
      image: json['image'] as String,
    );
  }
}
