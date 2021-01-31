part of 'pages.dart';

class AccountConfirmationPage extends StatefulWidget {
  final RegistrationModels registrationModels;
  AccountConfirmationPage(this.registrationModels);
  @override
  _AccountConfirmationPageState createState() =>
      _AccountConfirmationPageState();
}

class _AccountConfirmationPageState extends State<AccountConfirmationPage> {
  bool isSigningUp = false;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context
            .read<PageBloc>()
            .add(GoToPreferencePage(widget.registrationModels));
        return;
      },
      child: Scaffold(
        body: Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: defaultMargin.toDouble()),
          child: ListView(
            children: [
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20, bottom: 90),
                    height: 56,
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: GestureDetector(
                            onTap: () {
                              context.read<PageBloc>().add(GoToPreferencePage(
                                  widget.registrationModels));
                            },
                            child: Icon(
                              Icons.arrow_back,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Align(
                            alignment: Alignment.topCenter,
                            child: Text(
                              "Confirm\n New Account",
                              style: blackTextFont.copyWith(fontSize: 20),
                              textAlign: TextAlign.center,
                            ))
                      ],
                    ),
                  ),
                  Center(
                    child: Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: (widget.registrationModels.profileImage ==
                                      null)
                                  ? AssetImage('assets/icons/user_pic.png')
                                  : FileImage(
                                      widget.registrationModels.profileImage),
                              fit: BoxFit.cover)),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Column(
                      children: [
                        Text(
                          'Welcome',
                          style: blackTextFont.copyWith(fontSize: 16),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          (widget.registrationModels.name == null)
                              ? ""
                              : widget.registrationModels.name,
                          style: blackTextFont.copyWith(
                              fontSize: 20, fontWeight: FontWeight.w600),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 110,
                  ),
                  (isSigningUp)
                      ? SpinKitFadingCircle(
                          color: Color(0xFF3E9D9D),
                          size: 45,
                        )
                      : SizedBox(
                          height: 45,
                          width: 250,
                          child: ElevatedButton(
                            onPressed: () async {
                              setState(() {
                                isSigningUp = true;
                              });

                              imageFileToUpload =
                                  widget.registrationModels.profileImage;

                              SignInSignUpResult result =
                                  await AuthServices.signUp(
                                      widget.registrationModels.email,
                                      widget.registrationModels.password,
                                      widget.registrationModels.name,
                                      widget.registrationModels.selectedGenres,
                                      widget
                                          .registrationModels.selectedLanguage);
                              if (result.userModels == null) {
                                setState(() {
                                  isSigningUp = false;
                                });
                                Flushbar(
                                  duration: Duration(milliseconds: 1500),
                                  flushbarPosition: FlushbarPosition.TOP,
                                  backgroundColor: Color(0xFFFF5C83),
                                  message: 'Register telah berhasil',
                                )..show(context);
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                primary: Color(0xFF3E9D9D),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8))),
                            child: Text("Create My Account",
                                style: whiteTextFont.copyWith(fontSize: 16)),
                          ),
                        )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
