part of 'pages.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 136,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/icons/logo.png"))),
            ),
            Container(
              margin: EdgeInsets.only(top: 70, bottom: 16),
              child: Text(
                "New Experience",
                style: blackTextFont.copyWith(fontSize: 20),
              ),
            ),
            Container(
              child: Text(
                "Watch a new movie much\n easier than any before",
                style: greyTextFont.copyWith(
                    fontSize: 16, fontWeight: FontWeight.w300),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 70, bottom: 20),
              width: 250,
              height: 45,
              child: ElevatedButton(
                onPressed: () {
                  context
                      .read<PageBloc>()
                      .add(GoToRegistrationPage(RegistrationModels()));
                },
                child: Text(
                  'Get Started',
                  style: whiteTextFont.copyWith(fontSize: 16),
                ),
                style: ElevatedButton.styleFrom(
                  primary: mainColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already have an account? ',
                      style: greyTextFont.copyWith(fontSize: 14)),
                  GestureDetector(
                    onTap: () {
                      context.read<PageBloc>().add(GoToLoginPage());
                    },
                    child: Text(
                      'Sign In',
                      style: purpleTextFont.copyWith(fontSize: 16),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
