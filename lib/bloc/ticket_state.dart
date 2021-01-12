part of 'ticket_bloc.dart';

class TicketState extends Equatable {
  final List<TicketModels> tickets;
  const TicketState(this.tickets);

  @override
  List<Object> get props => [tickets];
}
