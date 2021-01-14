part of 'pages.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        context.read<PageBloc>().add(GoToMainPage());
        return;
      },
      child: Scaffold(
          body: SafeArea(
        child: Container(
          child: ListView(
            children: [
              Container(
                margin: EdgeInsets.only(
                    top: 20, left: defaultMargin.toDouble(), bottom: 10),
                height: 56,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: GestureDetector(
                          onTap: () {
                            context.read<PageBloc>().add(GoToMainPage());
                          },
                          child: Icon(Icons.arrow_back)),
                    )
                  ],
                ),
              ),
              BlocBuilder<UserBloc, UserState>(
                builder: (_, userState) => Center(
                  child: Column(
                    children: [
                      Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: (userState as UserLoaded)
                                            .userModels
                                            .profilePicture ==
                                        ""
                                    ? AssetImage('assets/icons/user_pic.png')
                                    : NetworkImage((userState as UserLoaded)
                                        .userModels
                                        .profilePicture),
                                fit: BoxFit.cover)),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        (userState as UserLoaded).userModels.name,
                        style: blackTextFont.copyWith(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text((userState as UserLoaded).userModels.email,
                          style: greyTextFont.copyWith(
                              fontSize: 16, fontWeight: FontWeight.w400))
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                margin: EdgeInsets.only(left: defaultMargin.toDouble()),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: 24,
                          height: 24,
                          margin: EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/icons/edit_profile.png'),
                                  fit: BoxFit.cover)),
                        ),
                        Text('Edit Profile',
                            style: blackTextFont.copyWith(
                                fontSize: 16, fontWeight: FontWeight.w600))
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Dash(
                      dashColor: Color(0xFFE4E4E4),
                      length: MediaQuery.of(context).size.width -
                          defaultMargin.toDouble(),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: 24,
                          height: 24,
                          margin: EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image:
                                      AssetImage('assets/icons/my_wallet.png'),
                                  fit: BoxFit.cover)),
                        ),
                        Text('My Wallet',
                            style: blackTextFont.copyWith(
                                fontSize: 16, fontWeight: FontWeight.w600))
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Dash(
                      dashColor: Color(0xFFE4E4E4),
                      length: MediaQuery.of(context).size.width -
                          defaultMargin.toDouble(),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: 24,
                          height: 24,
                          margin: EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image:
                                      AssetImage('assets/icons/language.png'),
                                  fit: BoxFit.cover)),
                        ),
                        Text('Change Language',
                            style: blackTextFont.copyWith(
                                fontSize: 16, fontWeight: FontWeight.w600))
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Dash(
                      dashColor: Color(0xFFE4E4E4),
                      length: MediaQuery.of(context).size.width -
                          defaultMargin.toDouble(),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: 24,
                          height: 24,
                          margin: EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/icons/help_centre.png'),
                                  fit: BoxFit.cover)),
                        ),
                        Text('Help Centre',
                            style: blackTextFont.copyWith(
                                fontSize: 16, fontWeight: FontWeight.w600))
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Dash(
                      dashColor: Color(0xFFE4E4E4),
                      length: MediaQuery.of(context).size.width -
                          defaultMargin.toDouble(),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: 24,
                          height: 24,
                          margin: EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/icons/rate.png'),
                                  fit: BoxFit.cover)),
                        ),
                        Text('Rate Flutix App',
                            style: blackTextFont.copyWith(
                                fontSize: 16, fontWeight: FontWeight.w600))
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Dash(
                      dashColor: Color(0xFFE4E4E4),
                      length: MediaQuery.of(context).size.width -
                          defaultMargin.toDouble(),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Container(
                  width: 250,
                  height: 45,
                  child: RaisedButton(
                    onPressed: () {},
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    color: mainColor,
                    child: Text(
                      'Sign Out',
                      style: whiteTextFont,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
