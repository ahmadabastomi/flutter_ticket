part of 'services.dart';

class TicketTransactionServices {
  static CollectionReference transactionCollection =
      FirebaseFirestore.instance.collection('transactions');
  static Future<void> saveTransaction(
      TicketTransactionModels ticketTransactionModels) async {
    await transactionCollection.doc().set({
      'úserID': ticketTransactionModels.userID,
      'title': ticketTransactionModels.title,
      'subtitle': ticketTransactionModels.subtitle,
      'time': ticketTransactionModels.time.millisecondsSinceEpoch,
      'amount': ticketTransactionModels.amount,
      'picture': ticketTransactionModels.picture
    });
  }

  static Future<List<TicketTransactionModels>> getTransactions(
      String userID) async {
    QuerySnapshot snapshot = await transactionCollection.get();
    var documents =
        snapshot.docs;

    return documents
        .map((e) => TicketTransactionModels(
            userID: e.data()['userID'],
            title: e.data()['title'],
            subtitle: e.data()['subtitle'],
            time: DateTime.fromMillisecondsSinceEpoch(e.data()['time']),
            amount: e.data()['amount'],
            picture: e.data()['picture']))
        .toList();
  }
}
