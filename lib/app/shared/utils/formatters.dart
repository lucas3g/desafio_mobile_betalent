import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class Formatters {}

extension FormatDate on DateTime {
  String formatDate() {
    final DateFormat format = DateFormat('dd/MM/yyyy');

    return format.format(this).toString();
  }
}

extension FormatDecimal on double {
  String formatDecimal() {
    final NumberFormat format = NumberFormat('###,###,##0.00', 'pt_BR');

    return format.format(this).toString();
  }
}

extension FormatMilhar on int {
  String formatMilhar() {
    final NumberFormat format = NumberFormat('#,##0.##', 'pt_BR');

    return format.format(this).toString();
  }
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}
