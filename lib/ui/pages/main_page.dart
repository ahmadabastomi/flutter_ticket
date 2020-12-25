part of 'pages.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          color: mainColor,
        ),
        SafeArea(
          child: Container(
            color: Color(0xFFF6F7F9),
          ),
        ),
        ListView(),
        createCustomBottomNavbar(),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            margin: EdgeInsets.only(bottom: 46),
            child: FloatingActionButton(
              elevation: 0,
              backgroundColor: accentColor2,
              onPressed: () {},
              child: SizedBox(
                width: 26,
                height: 26,
                child: Icon(
                  MdiIcons.walletPlus,
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
            ),
          ),
        )
      ],
    ));
  }

  Widget createCustomBottomNavbar() => Align(
        alignment: Alignment.bottomCenter,
        child: ClipPath(
          clipper: BottomNavbarClipper(),
          child: Container(
            height: 70,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
          ),
        ),
      );
}

class BottomNavbarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(size.width / 2 - 33, 0);
    path.quadraticBezierTo(size.width / 2 - 33, 33, size.width / 2, 33);
    path.quadraticBezierTo(size.width / 2 + 33, 33, size.width / 2 + 33, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
