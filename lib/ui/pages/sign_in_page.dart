part of 'pages.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isEmailValid = false;
  bool isPasswordValid = false;
  bool isSignIn = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        context.read<PageBloc>().add(GoToSplashPage());
        return;
      },
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Container(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: defaultMargin.toDouble()),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 30),
                          width: 66.91,
                          height: 70,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/icons/logo.png'))),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 70),
                          child: Text(
                            'Welcome Back,\nExplorer!',
                            style: blackTextFont.copyWith(fontSize: 20),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              top: 40, right: defaultMargin.toDouble()),
                          child: Column(
                            children: [
                              Theme(
                                data: Theme.of(context)
                                    .copyWith(primaryColor: accentColor2),
                                child: TextField(
                                  controller: emailController,
                                  onChanged: (text) {
                                    setState(() {
                                      isEmailValid =
                                          EmailValidator.validate(text);
                                    });
                                  },
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                      labelText: 'Email Address',
                                      hintText: 'Email Address',
                                      border: OutlineInputBorder(),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: accentColor2)),
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.always),
                                ),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              Theme(
                                data: Theme.of(context)
                                    .copyWith(primaryColor: accentColor2),
                                child: TextField(
                                    controller: passwordController,
                                    onChanged: (text) {
                                      setState(() {
                                        isPasswordValid =
                                            (text.length >= 6) ? true : false;
                                      });
                                    },
                                    obscureText: true,
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                        labelText: 'Password',
                                        hintText: 'Password',
                                        border: OutlineInputBorder(),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: accentColor2),
                                        ),
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.always)),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 30),
                      alignment: Alignment.center,
                      child: (isSignIn)
                          ? SpinKitFadingCircle(
                              color: mainColor,
                            )
                          : FlatButton(
                              height: 50,
                              color: (isEmailValid && isPasswordValid)
                                  ? mainColor
                                  : Color(0xFFE4E4E4),
                              onPressed: (isEmailValid && isPasswordValid)
                                  ? () async {
                                      setState(() {
                                        isSignIn = true;
                                      });

                                      SignInSignUpResult result =
                                          await AuthServices.signIn(
                                              emailController.text,
                                              passwordController.text);

                                      if (result.userModels == null) {
                                        setState(() {
                                          isSignIn = false;
                                        });
                                        Flushbar(
                                          duration: Duration(seconds: 4),
                                          flushbarPosition:
                                              FlushbarPosition.TOP,
                                          backgroundColor: Color(0xFFFF5C83),
                                          message: result.messages,
                                        )..show(context);
                                      }
                                    }
                                  : null,
                              child: Icon(
                                Icons.arrow_forward,
                                size: 24,
                                color: (isEmailValid && isPasswordValid)
                                    ? Colors.white
                                    : Color(0xFFBEBEBE),
                              ),
                              shape: CircleBorder(),
                            )),
                  Container(
                    margin: EdgeInsets.only(top: 50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Start fresh now? ',
                          style: greyTextFont.copyWith(fontSize: 14),
                        ),
                        GestureDetector(
                          child: Text(
                            'Sign Up',
                            style: purpleTextFont.copyWith(fontSize: 14),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
