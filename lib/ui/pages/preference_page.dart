part of 'pages.dart';

class PreferencePage extends StatefulWidget {
  final RegistrationModels registrationModels;
  final List<String> genres = [
    "Horror",
    "Music",
    "Action",
    "Drama",
    "War",
    "Crime"
  ];
  final List<String> languages = ["Bahasa", "English", "Japanese", "Korean"];

  PreferencePage(this.registrationModels);
  @override
  _PreferencePageState createState() => _PreferencePageState();
}

class _PreferencePageState extends State<PreferencePage> {
  List<String> selectedGenres = [];
  String selectedLanguage = "English";
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        widget.registrationModels.password = "";
        context
            .read<PageBloc>()
            .add(GoToRegistrationPage(widget.registrationModels));
        return;
      },
      child: Scaffold(
        body: Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: defaultMargin.toDouble()),
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 56,
                    margin: EdgeInsets.only(bottom: 4, top: 20),
                    child: GestureDetector(
                        onTap: () {
                          widget.registrationModels.password = "";
                          context.read<PageBloc>().add(
                              GoToRegistrationPage(widget.registrationModels));
                        },
                        child: Icon(Icons.arrow_back)),
                  ),
                  Text(
                    "Select Your Four\n Favourite Genres",
                    style: blackTextFont.copyWith(fontSize: 20),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Wrap(
                    spacing: 24,
                    runSpacing: 24,
                    children: generateGenreWidget(context),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Text(
                    "Movie Language\n You Prefer?",
                    style: blackTextFont.copyWith(fontSize: 20),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Wrap(
                      spacing: 24,
                      runSpacing: 24,
                      children: generateLanguageWidget(context)),
                  SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: FloatingActionButton(
                      onPressed: () {
                        if (selectedGenres.length != 4) {
                          Flushbar(
                            duration: Duration(milliseconds: 1500),
                            flushbarPosition: FlushbarPosition.TOP,
                            backgroundColor: Color(0xFFFF5C83),
                            message: "Harus memilih empat(4) genre",
                          )..show(context);
                        } else {
                          widget.registrationModels.selectedGenres =
                              selectedGenres;
                          widget.registrationModels.selectedLanguage =
                              selectedLanguage;

                          context.read<PageBloc>().add(
                              GoToAccountConfirmationPage(
                                  widget.registrationModels));
                        }
                      },
                      backgroundColor: mainColor,
                      child: Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> generateGenreWidget(BuildContext context) {
    double width =
        (MediaQuery.of(context).size.width - 2 * defaultMargin - 24) / 2;
    return widget.genres
        .map((e) => SelectableBox(
              e,
              width: width,
              isSelected: selectedGenres.contains(e),
              isEnabled: true,
              onTap: () {
                onSelectGenre(e);
              },
            ))
        .toList();
  }

  List<Widget> generateLanguageWidget(BuildContext context) {
    double width =
        (MediaQuery.of(context).size.width - 2 * defaultMargin - 24) / 2;
    return widget.languages
        .map((e) => SelectableBox(
              e,
              width: width,
              isEnabled: true,
              isSelected: selectedLanguage == e,
              onTap: () {
                setState(() {
                  selectedLanguage = e;
                });
              },
            ))
        .toList();
  }

  void onSelectGenre(String genre) {
    if (selectedGenres.contains(genre)) {
      setState(() {
        selectedGenres.remove(genre);
      });
    } else {
      if (selectedGenres.length < 4) {
        setState(() {
          selectedGenres.add(genre);
        });
      }
    }
  }
}
