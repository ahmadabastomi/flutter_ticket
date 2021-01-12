import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_ticket/models/models.dart';
import 'package:flutter_ticket/services/services.dart';

part 'ticket_event.dart';
part 'ticket_state.dart';

class TicketBloc extends Bloc<TicketEvent, TicketState> {
  TicketBloc() : super(TicketState([]));

  @override
  Stream<TicketState> mapEventToState(
    TicketEvent event,
  ) async* {
    if (event is BuyTicket) {
      await TicketServices.saveTicket(event.userID, event.ticketModels);

      List<TicketModels> tickets = state.tickets + [event.ticketModels];
      yield TicketState(tickets);
    } else if( event is GetTickets){
      List<TicketModels> tickets = await TicketServices.getTickets(event.userID);

      yield TicketState(tickets);
    }
  }
}
