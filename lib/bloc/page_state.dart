part of 'page_bloc.dart';

abstract class PageState extends Equatable {
  const PageState();

  @override
  List<Object> get props => [];
}

class OnInitialPage extends PageState {}

class OnSplashPage extends PageState {}

class OnLoginPage extends PageState {}

class OnMainPage extends PageState {}

class OnRegistrationPage extends PageState {
  final RegistrationModels registrationModels;
  OnRegistrationPage(this.registrationModels);
  @override
  List<Object> get props => [registrationModels];
}

class OnPreferencePage extends PageState {
  final RegistrationModels registrationModels;
  OnPreferencePage(this.registrationModels);
  @override
  List<Object> get props => [registrationModels];
}

class OnAccountConfirmationPage extends PageState {
  final RegistrationModels registrationModels;
  OnAccountConfirmationPage(this.registrationModels);
  @override
  List<Object> get props => [registrationModels];
}

class OnMovieDetailPage extends PageState {
  final MovieModels movieModels;
  OnMovieDetailPage(this.movieModels);
  @override
  List<Object> get props => [movieModels];
}

class OnSelectSchedulePage extends PageState {
  final MovieDetailModels movieDetailModels;
  OnSelectSchedulePage(this.movieDetailModels);
  @override
  List<Object> get props => [movieDetailModels];
}

class OnSelectSeatPage extends PageState {
  final TicketModels ticketModels;
  OnSelectSeatPage(this.ticketModels);
  @override
  List<Object> get props => [ticketModels];
}

class OnCheckoutPage extends PageState {
  final TicketModels ticketModels;
  OnCheckoutPage(this.ticketModels);
  @override
  List<Object> get props => [ticketModels];
}

class OnSuccesspage extends PageState {
  final TicketModels ticketModels;
  final TicketTransactionModels ticketTransactionModels;

  OnSuccesspage(this.ticketModels, this.ticketTransactionModels);

  @override
  List<Object> get props => [ticketModels, ticketTransactionModels];
}

class OnTicketDetailPage extends PageState {
  final TicketModels ticketModels;
  OnTicketDetailPage(this.ticketModels);
  @override
  List<Object> get props => [ticketModels];
}

class OnProfilePage extends PageState {}

class OnTopUpPage extends PageState {
  final PageEvent pageEvent;
  OnTopUpPage(this.pageEvent);
  List<Object> get props => [pageEvent];
}
