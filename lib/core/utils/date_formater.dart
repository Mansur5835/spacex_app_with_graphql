class DateDormater {
  static String? dateToMobile(String? date) {
    //2023-01-28T!10:20

    if (date == null) return null;

    List<String> dateInList = date.substring(0, 10).split("-");

    String year = dateInList[0];
    String day = dateInList[2];
    String month = dateInList[1];

    switch (int.parse(month)) {
      case 1:
        month = "January";
        break;
      case 2:
        month = "February";
        break;
      case 3:
        month = "March";
        break;
      case 4:
        month = "April";
        break;
      case 5:
        month = "May";
        break;
      case 6:
        month = "June";
        break;
      case 7:
        month = "July";
        break;
      case 8:
        month = "August";
        break;
      case 9:
        month = "September";
        break;
      case 10:
        month = "October";
        break;
      case 11:
        month = "November";
        break;
      case 12:
        month = "December";
        break;
    }

    return "$day-$month, $year";
  }
}
