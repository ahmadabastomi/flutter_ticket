part of 'pages.dart';

class MovieDetailPage extends StatelessWidget {
  final MovieModels movieModels;
  MovieDetailPage(this.movieModels);
  @override
  Widget build(BuildContext context) {
    MovieDetailModels movieDetailModels;
    List<CreditModels> creditModels;
    return WillPopScope(
      onWillPop: () {
        context.read<PageBloc>().add(GoToMainPage());
        return;
      },
      child: Scaffold(
        body: FutureBuilder(
          future: MovieServices.getDetails(movieModels),
          builder: (_, snapshotDetail) {
            if (snapshotDetail.hasData) {
              movieDetailModels = snapshotDetail.data;
              return FutureBuilder(
                future: MovieServices.getCredits(movieModels.id),
                builder: (_, snapshotCredit) {
                  if (snapshotCredit.hasData) {
                    creditModels = snapshotCredit.data;
                    return Container(
                      color: accentColor1,
                      child: SafeArea(
                        child: ListView(children: [
                          Container(
                            color: Color(0xFFE5E5E5),
                            child: Column(
                              children: [
                                //note: Image Header Backdrop
                                Stack(
                                  children: [
                                    Container(
                                      height: 270,
                                      margin: EdgeInsets.only(bottom: 16),
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: NetworkImage(imageBaseURL +
                                                  "w780" +
                                                  movieModels.backdropPath),
                                              fit: BoxFit.cover)),
                                      child: Container(
                                        height: 270,
                                        decoration: BoxDecoration(
                                            border: Border(
                                                bottom: BorderSide(
                                                    width: 1.0,
                                                    color: Colors.white)),
                                            gradient: LinearGradient(
                                                begin: Alignment.bottomCenter,
                                                end: Alignment.center,
                                                colors: [
                                                  Color(0xFFE5E5E5),
                                                  Color(0xFFE5E5E5)
                                                      .withOpacity(0)
                                                ])),
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.topLeft,
                                      margin:
                                          EdgeInsets.only(top: 36, left: defaultMargin.toDouble()),
                                      child: GestureDetector(
                                        onTap: () {
                                          context
                                              .read<PageBloc>()
                                              .add(GoToMainPage());
                                        },
                                        child: Icon(
                                          Icons.arrow_back,
                                          color: Colors.white,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                //note: Movie Text Title
                                Center(
                                  child: Text(
                                    movieModels.title,
                                    style: blackTextFont.copyWith(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w600),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                //note: Movie Genre
                                Center(
                                  child: Text(
                                    movieDetailModels.genresLanguage,
                                    style: greyTextFont.copyWith(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w300),
                                  ),
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                //note: Rating Start Vote Average
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    RatingStarts(
                                      voteAverage: movieModels.voteAverage,
                                      labelColor: Color(0xFFADADAD),
                                    )
                                  ],
                                ),
                                //note: Cast & Crew Title
                                Container(
                                  alignment: Alignment.centerLeft,
                                  margin: EdgeInsets.fromLTRB(
                                      defaultMargin.toDouble(),
                                      24,
                                      defaultMargin.toDouble(),
                                      12),
                                  child: Text(
                                    'Cast & Crew',
                                    style: blackTextFont.copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 110,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: creditModels.length,
                                    itemBuilder: (_, index) => Container(
                                      margin: EdgeInsets.only(
                                          left: (index == 0)
                                              ? defaultMargin.toDouble()
                                              : 0,
                                          right:
                                              (index == creditModels.length - 1)
                                                  ? defaultMargin.toDouble()
                                                  : 16),
                                      child: CreditCard(creditModels[index]),
                                    ),
                                  ),
                                ),
                                //note: Storyline Movie Text
                                Container(
                                  alignment: Alignment.centerLeft,
                                  margin: EdgeInsets.only(
                                      top: 24,
                                      left: defaultMargin.toDouble(),
                                      bottom: 8,
                                      right: defaultMargin.toDouble()),
                                  child: Text(
                                    'Storyline',
                                    style: blackTextFont.copyWith(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  margin: EdgeInsets.only(
                                      left: defaultMargin.toDouble(),
                                      right: defaultMargin.toDouble(),
                                      bottom: 30),
                                  child: Text(
                                    movieModels.overview,
                                    style: greyTextFont.copyWith(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w300),
                                  ),
                                ),
                                //note: Button Continue to Book
                                Center(
                                  child: Container(
                                    width: 250,
                                    height: 45,
                                    child: RaisedButton(
                                      onPressed: () {
                                        context.read<PageBloc>().add(
                                            GoToSelectSchedulePage(
                                                movieDetailModels));
                                      },
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      color: mainColor,
                                      child: Text(
                                        'Continue to Book',
                                        style: whiteTextFont.copyWith(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w300),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 100,
                                )
                              ],
                            ),
                          ),
                        ]),
                      ),
                    );
                  } else {
                    return SizedBox();
                  }
                },
              );
            } else {
              return SizedBox();
            }
          },
        ),
      ),
    );
  }
}
