part of 'pages.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int bottomNavbarIndex;
  PageController pageController;

  @override
  void initState() {
    super.initState();
    bottomNavbarIndex = 0;
    pageController = PageController(initialPage: bottomNavbarIndex);
  }

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
        PageView(
          controller: pageController,
          onPageChanged: (index) {
            setState(() {
              bottomNavbarIndex = index;
            });
          },
          children: [
            MoviePage(),
            TicketPage(),
          ],
        ),
        createCustomBottomNavbar(),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            margin: EdgeInsets.only(bottom: 46),
            child: FloatingActionButton(
              elevation: 0,
              backgroundColor: accentColor2,
              onPressed: () {
                context.read<PageBloc>().add(GoToTopUpPage(GoToMainPage()));
              },
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
            child: BottomNavigationBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              selectedItemColor: mainColor,
              unselectedItemColor: Color(0xFFE5E5E5),
              selectedLabelStyle: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
              unselectedLabelStyle: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFFE5E5E5)),
              currentIndex: bottomNavbarIndex,
              onTap: (index) {
                setState(() {
                  bottomNavbarIndex = index;
                  pageController.jumpToPage(index);
                });
              },
              items: [
                BottomNavigationBarItem(
                    label: 'New Movies',
                    icon: Container(
                      margin: EdgeInsets.only(bottom: 6),
                      height: 20,
                      child: Image.asset((bottomNavbarIndex == 0)
                          ? 'assets/icons/ic_movie.png'
                          : 'assets/icons/ic_movie_grey.png'),
                    )),
                BottomNavigationBarItem(
                    label: 'My Tickets',
                    icon: Container(
                      margin: EdgeInsets.only(bottom: 6),
                      height: 20,
                      child: Image.asset((bottomNavbarIndex == 1)
                          ? 'assets/icons/ic_tickets.png'
                          : 'assets/icons/ic_tickets_grey.png'),
                    )),
              ],
            ),
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
