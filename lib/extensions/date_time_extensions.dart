part of 'extensions.dart';

extension DateTimeExtensions on DateTime {
  String get dateAndTime => "${this.shortDayName} ${this.day}, ${this.hour}:00";
  String get shortDayName {
    switch (this.weekday) {
      case 1:
        return 'Mon';
        break;
      case 2:
        return 'Tue';
        break;
      case 3:
        return 'Wed';
        break;
      case 4:
        return 'Thu';
        break;
      case 5:
        return 'Fri';
        break;
      case 6:
        return 'Sat';
        break;
      default:
        return 'Sun';
    }
  }
}
