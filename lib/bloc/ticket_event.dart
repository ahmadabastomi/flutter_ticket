part of 'ticket_bloc.dart';

abstract class TicketEvent extends Equatable {
  const TicketEvent();

  @override
  List<Object> get props => [];
}

class GetTickets extends TicketEvent {
  final String userID;
  GetTickets(this.userID);

  @override
  List<Object> get props => [userID];
}

class BuyTicket extends TicketEvent {
  final TicketModels ticketModels;
  final String userID;

  BuyTicket(this.ticketModels, this.userID);

  @override
  List<Object> get props => [ticketModels, userID];
}
