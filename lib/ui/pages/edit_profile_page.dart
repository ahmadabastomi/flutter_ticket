part of 'pages.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  String tmpProfilePicture;
  File tmpFileProfilePicture;
  String tmpName;
  String tmpEmail;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController retypePasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        context.read<PageBloc>().add(GoToProfilePage());
        return;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: BlocBuilder<UserBloc, UserState>(
          builder: (_, userState) {
            if (userState is UserLoaded) {
              tmpProfilePicture = userState.userModels.profilePicture;
              tmpName = userState.userModels.name;
              tmpEmail = userState.userModels.email;
              nameController.text = userState.userModels.name;
              emailController.text = userState.userModels.email;
              return Container(
                padding:
                    EdgeInsets.symmetric(horizontal: defaultMargin.toDouble()),
                child: SafeArea(
                  child: ListView(
                    children: [
                      //note: Header
                      Container(
                        margin: EdgeInsets.only(top: 20, bottom: 22),
                        height: 56,
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: GestureDetector(
                                  onTap: () {
                                    context
                                        .read<PageBloc>()
                                        .add(GoToProfilePage());
                                  },
                                  child: Icon(Icons.arrow_back)),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                'Edit\n Profile',
                                style: blackTextFont.copyWith(
                                    fontSize: 20, fontWeight: FontWeight.w400),
                                textAlign: TextAlign.center,
                              ),
                            )
                          ],
                        ),
                      ),
                      //note: Photo Profile
                      Center(
                        child: Container(
                          width: 90,
                          height: 104,
                          child: Stack(
                            children: [
                              Container(
                                width: 90,
                                height: 90,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: (tmpFileProfilePicture != null)
                                            ? FileImage(tmpFileProfilePicture)
                                            : (tmpProfilePicture == null)
                                                ? AssetImage(
                                                    'assets/icons/user_pic.png')
                                                : NetworkImage(
                                                    tmpProfilePicture),
                                        fit: BoxFit.cover)),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: GestureDetector(
                                  onTap: () async {
                                    tmpFileProfilePicture =
                                        await getImageFromDevice();
                                    tmpProfilePicture = null;
                                    setState(() {});
                                  },
                                  child: Container(
                                    width: 28,
                                    height: 28,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(tmpProfilePicture ==
                                                    null
                                                ? 'assets/icons/btn_add_photo.png'
                                                : 'assets/icons/btn_del_photo.png'),
                                            fit: BoxFit.cover)),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      //note: Form Edit Profile
                      Theme(
                        data: Theme.of(context)
                            .copyWith(primaryColor: accentColor2),
                        child: TextField(
                          controller: nameController,
                          keyboardType: TextInputType.name,
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
                        data: Theme.of(context).copyWith(
                          primaryColor: accentColor2,
                        ),
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
                          keyboardType: TextInputType.text,
                          obscureText: true,
                          decoration: InputDecoration(
                              labelText: 'Confirma Password',
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
                      Center(
                        child: SizedBox(
                          width: 250,
                          height: 45,
                          child: RaisedButton(
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
                                  message:
                                      "Panjang minimal password 6 character",
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
                                
                              }
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            color: mainColor,
                            child: Text('Update My Profile',
                                style: whiteTextFont.copyWith(fontSize: 16)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      )
                    ],
                  ),
                ),
              );
            } else {
              return SpinKitFadingCircle(
                color: mainColor,
                size: 50,
              );
            }
          },
        ),
      ),
    );
  }
}
