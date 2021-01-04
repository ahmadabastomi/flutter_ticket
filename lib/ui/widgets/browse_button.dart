part of 'widgets.dart';

class BrowseButton extends StatelessWidget {
  final String selectedGenre;
  BrowseButton(this.selectedGenre);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 68,
        width: (MediaQuery.of(context).size.width - 2 * defaultMargin - 48) / 4,
        child: Column(
          children: [
            Container(
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Color(0xFFEBEFF6),
              ),
              child: Center(
                child: Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          alignment: Alignment.center,
                          image: AssetImage((selectedGenre == 'Action')
                              ? 'assets/icons/ic_action.png'
                              : (selectedGenre == 'Crime')
                                  ? 'assets/icons/ic_crime.png'
                                  : (selectedGenre == 'Drama')
                                      ? 'assets/icons/ic_drama.png'
                                      : (selectedGenre == 'Music')
                                          ? 'assets/icons/ic_music.png'
                                          : (selectedGenre == 'Horror')
                                              ? 'assets/icons/ic_horror.png'
                                              : 'assets/icons/ic_war.png'))),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 4),
              child: Text(
                selectedGenre,
                style: blackTextFont.copyWith(fontSize: 12),
              ),
            )
          ],
        ),
      ),
    );
  }
}
