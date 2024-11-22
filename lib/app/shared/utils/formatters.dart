import 'package:intl/intl.dart';

class Formatters {}

extension FormatDate on DateTime {
  String formatDate() {
    final DateFormat format = DateFormat('dd/MM/yyyy');

    return format.format(this).toString();
  }
}

extension FormatPhone on String {
  String formatPhone() {
    if (length < 13) {
      throw Exception('Telefone inválido');
    }

    final result =
        '+${substring(0, 2)} (${substring(2, 4)}) ${substring(4, 9)}-${substring(9, 13)}';
    return result;
  }
}
