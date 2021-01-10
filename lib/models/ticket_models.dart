part of 'models.dart';

class TicketModels extends Equatable {
  final MovieDetailModels movieDetailModels;
  final TheaterModels theaterModels;
  final DateTime time;
  final String bookingCode;
  final List<String> seats;
  final String name;
  final int totalPrice;
  TicketModels(this.movieDetailModels, this.theaterModels, this.time,
      this.bookingCode, this.seats, this.name, this.totalPrice);

  TicketModels copyWith(
    MovieDetailModels movieDetailModels,
    TheaterModels theaterModels,
    DateTime time,
    String bookingCode,
    List<String> seats,
    String name,
    int totalPrice,
  ) =>
      TicketModels(
          movieDetailModels ?? this.movieDetailModels,
          theaterModels ?? theaterModels,
          time ?? this.time,
          bookingCode ?? this.bookingCode,
          seats ?? this.seats,
          name ?? this.name,
          totalPrice ?? this.totalPrice);

  String get seatsInString {
    String s = '';
    for (var seat in seats) {
      s += seat + ((seat != seats.last) ? ', ' : '');
    }
    return s;
  }

  @override
  List<Object> get props => [
        movieDetailModels,
        theaterModels,
        time,
        bookingCode,
        seats,
        name,
        totalPrice
      ];
}
