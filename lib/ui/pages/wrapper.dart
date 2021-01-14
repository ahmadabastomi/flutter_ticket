part of 'pages.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);
    if (user == null) {
      if (!(prevPageEvent is GoToSplashPage)) {
        prevPageEvent = GoToSplashPage();
        context.watch<PageBloc>().add(prevPageEvent);
      }
    } else {
      if (!(prevPageEvent is GoToMainPage)) {
        context.watch<UserBloc>().add(LoadUser(user.uid));
        context.watch<TicketBloc>().add(GetTickets(user.uid));
        prevPageEvent = GoToMainPage();
        context.watch<PageBloc>().add(prevPageEvent);
      }
    }
    return BlocBuilder<PageBloc, PageState>(
        builder: (_, pageState) => (pageState is OnSplashPage)
            ? SplashPage()
            : (pageState is OnLoginPage)
                ? SignInPage()
                : (pageState is OnRegistrationPage)
                    ? SignUpPage(pageState.registrationModels)
                    : (pageState is OnPreferencePage)
                        ? PreferencePage(pageState.registrationModels)
                        : (pageState is OnAccountConfirmationPage)
                            ? AccountConfirmationPage(
                                pageState.registrationModels)
                            : (pageState is OnMovieDetailPage)
                                ? MovieDetailPage(pageState.movieModels)
                                : (pageState is OnSelectSchedulePage)
                                    ? SelectSchedulePage(
                                        pageState.movieDetailModels)
                                    : (pageState is OnSelectSeatPage)
                                        ? SelectSeatPage(pageState.ticketModels)
                                        : (pageState is OnCheckoutPage)
                                            ? CheckoutPage(
                                                pageState.ticketModels)
                                            : (pageState is OnSuccesspage)
                                                ? SuccessPage(
                                                    pageState.ticketModels,
                                                    pageState
                                                        .ticketTransactionModels)
                                                : (pageState
                                                        is OnTicketDetailPage)
                                                    ? TicketDetailPage(
                                                        pageState.ticketModels)
                                                    : (pageState
                                                            is OnProfilePage)
                                                        ? ProfilePage()
                                                        : MainPage());
  }
}
