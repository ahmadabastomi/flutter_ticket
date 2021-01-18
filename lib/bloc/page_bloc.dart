import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_ticket/models/models.dart';

part 'page_event.dart';
part 'page_state.dart';

class PageBloc extends Bloc<PageEvent, PageState> {
  PageBloc() : super(OnInitialPage());

  @override
  Stream<PageState> mapEventToState(
    PageEvent event,
  ) async* {
    if (event is GoToSplashPage) {
      yield OnSplashPage();
    } else if (event is GoToLoginPage) {
      yield OnLoginPage();
    } else if (event is GoToMainPage) {
      yield OnMainPage(bottomNavbarIndex: event.bottomNavbarIndex,isExpiredTicket: event.isExpiredTicket);
    } else if (event is GoToRegistrationPage) {
      yield OnRegistrationPage(event.registrationModels);
    } else if (event is GoToPreferencePage) {
      yield OnPreferencePage(event.registrationModels);
    } else if (event is GoToAccountConfirmationPage) {
      yield OnAccountConfirmationPage(event.registrationModels);
    } else if (event is GoToMovieDetailPage) {
      yield OnMovieDetailPage(event.movieModels);
    } else if (event is GoToSelectSchedulePage) {
      yield OnSelectSchedulePage(event.movieDetailModels);
    } else if (event is GoToSelectSeatPage) {
      yield OnSelectSeatPage(event.ticketModels);
    } else if (event is GoToCheckoutPage) {
      yield OnCheckoutPage(event.ticketModels);
    } else if (event is GoToSuccesspage) {
      yield OnSuccesspage(event.ticketModels, event.ticketTransactionModels);
    } else if (event is GoToTicketDetailPage) {
      yield OnTicketDetailPage(event.ticketModels);
    } else if (event is GoToProfilePage) {
      yield OnProfilePage();
    } else if (event is GoToTopUpPage) {
      yield OnTopUpPage(event.pageEvent);
    } else if (event is GoToWalletPage) {
      yield OnWalletPage(event.pageEvent);
    } else if (event is GoToEditProfilePage) {
      yield OnEditProfilePage();
    }
  }
}
