part of 'services.dart';

class TicketServices {
  static CollectionReference ticketCollection =
      FirebaseFirestore.instance.collection('tickets');

  static Future<void> saveTicket(String id, TicketModels ticketModels) async {
    await ticketCollection.doc().set({
      'movieID': ticketModels.movieDetailModels.id ?? "",
      'userID': id ?? "",
      'theaterName': ticketModels.theaterModels.name ?? "",
      'time': ticketModels.time.millisecondsSinceEpoch ??
          DateTime.now().millisecondsSinceEpoch,
      'bookingCode': ticketModels.bookingCode ?? "",
      'seats': ticketModels.seatsInString ?? "",
      'name': ticketModels.name,
      'totalPrice': ticketModels.totalPrice
    });
  }

  static Future<List<TicketModels>> getTickets(String userId) async {
    QuerySnapshot snapshot = await ticketCollection.get();
    var documents =
        snapshot.docs.where((doc) => doc.data()['userID'] == userId);

    List<TicketModels> tickets = [];

    for (var document in documents) {
      MovieDetailModels movieDetailModels = await MovieServices.getDetails(null,
          movieID: document.data()['movieID']);
      tickets.add(TicketModels(
          movieDetailModels,
          TheaterModels(document.data()['theaterName']),
          DateTime.fromMillisecondsSinceEpoch(document.data()['time']),
          document.data()['bookingCode'],
          document.data()['seats'].toString().split(','),
          document.data()['name'],
          document.data()['totalPrice']));
    }
    return tickets;
  }
}
