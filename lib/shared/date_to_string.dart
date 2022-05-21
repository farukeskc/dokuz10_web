String dateToString(DateTime date) {
  String? month;
  if (date.month == 1) {
    month = 'Ocak';
  } else if (date.month == 2) {
    month = 'Şubat';
  } else if (date.month == 3) {
    month = 'Mart';
  } else if (date.month == 4) {
    month = 'Nisan';
  } else if (date.month == 5) {
    month = 'Mayıs';
  } else if (date.month == 6) {
    month = 'Haziran';
  } else if (date.month == 7) {
    month = 'Temmuz';
  } else if (date.month == 8) {
    month = 'Ağustos';
  } else if (date.month == 9) {
    month = 'Eylül';
  } else if (date.month == 10) {
    month = 'Ekim';
  } else if (date.month == 11) {
    month = 'Kasım';
  } else if (date.month == 12) {
    month = 'Aralık';
  }
  return ('${date.day} $month ${date.year}');
}
