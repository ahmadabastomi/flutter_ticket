part of 'pages.dart';

class SignUpPage extends StatefulWidget {
  final RegistrationModels registrationModels;

  SignUpPage(this.registrationModels);
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController retypePasswordController = TextEditingController();
  @override
  void initState() {
    nameController.text = widget.registrationModels.name;
    emailController.text = widget.registrationModels.email;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        context.read<PageBloc>().add(GoToSplashPage());
        return;
      },
      child: Scaffold(
        body: Container(
            padding: EdgeInsets.symmetric(horizontal: defaultMargin.toDouble()),
            child: ListView(
              children: [
                Column(
                  children: [
                    //note: HEADER
                    Container(
                      margin: EdgeInsets.only(top: 20, bottom: 22),
                      height: 56,
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: GestureDetector(
                              onTap: () {
                                context.read<PageBloc>().add(GoToSplashPage());
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
                              'Create New\n Your Account',
                              style: blackTextFont.copyWith(fontSize: 20),
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: 90,
                      height: 104,
                      child: Stack(
                        children: [
                          Container(
                            height: 90,
                            width: 90,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: (widget.registrationModels
                                                .profileImage ==
                                            null)
                                        ? AssetImage(
                                            'assets/icons/user_pic.png')
                                        : FileImage(widget
                                            .registrationModels.profileImage),
                                    fit: BoxFit.cover)),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: GestureDetector(
                              onTap: () async {
                                if (widget.registrationModels.profileImage ==
                                    null) {
                                  widget.registrationModels.profileImage =
                                      await getImageFromDevice();
                                } else {
                                  widget.registrationModels.profileImage = null;
                                }
                                setState(() {});
                              },
                              child: Container(
                                height: 28,
                                width: 28,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: AssetImage((widget
                                                    .registrationModels
                                                    .profileImage ==
                                                null)
                                            ? 'assets/icons/btn_add_photo.png'
                                            : 'assets/icons/btn_del_photo.png'))),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Theme(
                      data: Theme.of(context)
                          .copyWith(primaryColor: accentColor2),
                      child: TextField(
                        controller: nameController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            labelText: 'Full Name',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: accentColor2)),
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
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            labelText: 'Email',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: accentColor2)),
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
                        obscureText: true,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            labelText: 'Password',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: accentColor2)),
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
                        controller: retypePasswordController,
                        obscureText: true,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            labelText: 'Confirm Password',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: accentColor2)),
                            floatingLabelBehavior:
                                FloatingLabelBehavior.always),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: FlatButton(
                        onPressed: () {
                          if ((nameController.text.trim() == "" &&
                              emailController.text.trim() == "" &&
                              passwordController.text.trim() == "" &&
                              retypePasswordController.text.trim() == "")) {
                            Flushbar(
                              duration: Duration(milliseconds: 1500),
                              flushbarPosition: FlushbarPosition.TOP,
                              backgroundColor: Color(0xFFFF5C83),
                              message: "Inputan tidak boleh kosong",
                            )..show(context);
                          } else if (passwordController.text !=
                              retypePasswordController.text) {
                            Flushbar(
                              duration: Duration(milliseconds: 1500),
                              flushbarPosition: FlushbarPosition.TOP,
                              backgroundColor: Color(0xFFFF5C83),
                              message:
                                  "Password dan confirmation password tidak sesuai",
                            )..show(context);
                          } else if (passwordController.text.length < 6) {
                            Flushbar(
                              duration: Duration(milliseconds: 1500),
                              flushbarPosition: FlushbarPosition.TOP,
                              backgroundColor: Color(0xFFFF5C83),
                              message: "Panjang minimal password 6 character",
                            )..show(context);
                          } else if (!EmailValidator.validate(
                              emailController.text)) {
                            Flushbar(
                              duration: Duration(milliseconds: 1500),
                              flushbarPosition: FlushbarPosition.TOP,
                              backgroundColor: Color(0xFFFF5C83),
                              message: "Format email tidak sesuai",
                            )..show(context);
                          } else {
                            widget.registrationModels.name =
                                nameController.text;
                            widget.registrationModels.email =
                                emailController.text;
                            widget.registrationModels.password =
                                passwordController.text;

                            context.read<PageBloc>().add(
                                GoToPreferencePage(widget.registrationModels));
                          }
                        },
                        height: 50,
                        color: mainColor,
                        shape: CircleBorder(),
                        child: Icon(
                          Icons.arrow_forward,
                          size: 24,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                )
              ],
            )),
      ),
    );
  }
}
