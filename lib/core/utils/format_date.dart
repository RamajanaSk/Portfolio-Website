class AppDateFormatter {
  AppDateFormatter._();

  static const List<String> _months = [
    'JAN',
    'FEB',
    'MAR',
    'APR',
    'MAY',
    'JUN',
    'JUL',
    'AUG',
    'SEP',
    'OCT',
    'NOV',
    'DEC',
  ];

  static String monthAndYear(DateTime date) {
    final month = _months[date.month - 1];

    return '$month ${date.year}';
  }
}
