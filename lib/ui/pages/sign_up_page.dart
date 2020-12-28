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
                  Container(
                    margin: EdgeInsets.only(top: 20, bottom: 22),
                    height: 56,
                    child: Stack(
                      children: [
                        Align(alignment: Alignment.centerLeft,child: GestureDetector(
                          onTap: () {context.read<PageBloc>().add(GoToSplashPage());},
                          child: Icon(Icons.arrow_back,color: Colors.black,),
                        ),),
                      ],
                    ),
                  )
                ],
              )
            ],
          )
        ),
      ),
    );
  }
}
