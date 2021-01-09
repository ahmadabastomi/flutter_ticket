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
