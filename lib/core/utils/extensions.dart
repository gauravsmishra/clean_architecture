import 'package:intl/intl.dart';

/// Provides date formatting functionality for [DateTime] objects.
extension DateTimeFormatting on DateTime {
  /// Formats the [DateTime] object to a string in 'MMM d yyyy' format, eg Jun 20 2024 .
  String toFormattedString() {
    String formattedDate = DateFormat('MMM d yyyy').format(this);
    return formattedDate;
  }
}

extension RuntimeFormatter on int {
  /// Converts the integer value to a string in 'Xhr Ym' format, eg 2hr 45min.
  String toRuntimeString() {
    final int hours = this ~/ 60;
    final int minutes = this % 60;
    return '${hours}hr ${minutes}m';
  }
}
