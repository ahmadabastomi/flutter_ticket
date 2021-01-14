part of 'page_bloc.dart';

abstract class PageEvent extends Equatable {
  const PageEvent();

  @override
  List<Object> get props => [];
}

class GoToSplashPage extends PageEvent {}

class GoToLoginPage extends PageEvent {}

class GoToMainPage extends PageEvent {}

class GoToRegistrationPage extends PageEvent {
  final RegistrationModels registrationModels;
  GoToRegistrationPage(this.registrationModels);
  @override
  List<Object> get props => [registrationModels];
}

class GoToPreferencePage extends PageEvent {
  final RegistrationModels registrationModels;
  GoToPreferencePage(this.registrationModels);
  @override
  List<Object> get props => [registrationModels];
}

class GoToAccountConfirmationPage extends PageEvent {
  final RegistrationModels registrationModels;
  GoToAccountConfirmationPage(this.registrationModels);
  @override
  List<Object> get props => [registrationModels];
}

class GoToMovieDetailPage extends PageEvent {
  final MovieModels movieModels;
  GoToMovieDetailPage(this.movieModels);
  @override
  List<Object> get props => [movieModels];
}

class GoToSelectSchedulePage extends PageEvent {
  final MovieDetailModels movieDetailModels;
  GoToSelectSchedulePage(this.movieDetailModels);
  @override
  List<Object> get props => [movieDetailModels];
}

class GoToSelectSeatPage extends PageEvent {
  final TicketModels ticketModels;
  GoToSelectSeatPage(this.ticketModels);
  @override
  List<Object> get props => [ticketModels];
}

class GoToCheckoutPage extends PageEvent {
  final TicketModels ticketModels;
  GoToCheckoutPage(this.ticketModels);
  @override
  List<Object> get props => [ticketModels];
}

class GoToSuccesspage extends PageEvent {
  final TicketModels ticketModels;
  final TicketTransactionModels ticketTransactionModels;

  GoToSuccesspage(this.ticketModels, this.ticketTransactionModels);

  @override
  List<Object> get props => [ticketModels, ticketTransactionModels];
}

class GoToTicketDetailPage extends PageEvent {
  final TicketModels ticketModels;
  GoToTicketDetailPage(this.ticketModels);
  @override
  List<Object> get props => [ticketModels];
}

class GoToProfilePage extends PageEvent {}