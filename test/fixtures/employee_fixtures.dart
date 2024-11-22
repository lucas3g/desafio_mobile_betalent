import 'dart:convert';

import 'package:desafio_mobile_betalent/app/modules/employees/domain/entities/employee.dart';

class EmployeeFixtures {
  static String employeesJson() => jsonEncode(<Map<String, dynamic>>[
        {
          "id": 1,
          "name": "João",
          "job": "Back-end",
          "admission_date": "2019-12-02T00:00:00.000Z",
          "phone": "5551234567890",
          "image":
              "https://img.favpng.com/25/7/23/computer-icons-user-profile-avatar-image-png-favpng-LFqDyLRhe3PBXM0sx2LufsGFU.jpg"
        },
        {
          "id": 2,
          "name": "Roberto",
          "job": "Front-end",
          "admission_date": "2020-03-12T00:00:00.000Z",
          "phone": "5550321654789",
          "image":
              "https://e7.pngegg.com/pngimages/550/997/png-clipart-user-icon-foreigners-avatar-child-face.png"
        },
      ]);

  static List<Employee> employees() => <Employee>[
        Employee(
          id: 1,
          name: 'João',
          job: 'Back-end',
          admissionDate: DateTime.parse('2019-12-02T00:00:00.000Z'),
          phone: '5551234567890',
          image:
              'https://img.favpng.com/25/7/23/computer-icons-user-profile-avatar-image-png-favpng-LFqDyLRhe3PBXM0sx2LufsGFU.jpg',
        ),
        Employee(
          id: 2,
          name: 'Roberto',
          job: 'Front-end',
          admissionDate: DateTime.parse('2020-03-12T00:00:00.000Z'),
          phone: '5550321654789',
          image:
              'https://e7.pngegg.com/pngimages/550/997/png-clipart-user-icon-foreigners-avatar-child-face.png',
        ),
      ];
}
