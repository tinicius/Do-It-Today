String formatDate(DateTime date) {
  String day =
      date.day.toString().length < 2 ? "0${date.day}" : date.day.toString();
  String month = date.month.toString().length < 2
      ? "0${date.month}"
      : date.month.toString();
  String year = date.year.toString();

  return "$day/$month/$year";
}
