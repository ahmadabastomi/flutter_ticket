part of 'pages.dart';

class MoviePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        // note: Header Movie Page
        Container(
          decoration: BoxDecoration(
            color: accentColor1,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)),
          ),
          padding: EdgeInsets.fromLTRB(
              defaultMargin.toDouble(), 20, defaultMargin.toDouble(), 30),
          child: BlocBuilder<UserBloc, UserState>(builder: (_, userState) {
            if (userState is UserLoaded) {
              if (imageFileToUpload != null) {
                uploadImage(imageFileToUpload).then((downloadUrl) {
                  imageFileToUpload = null;
                  context
                      .read<UserBloc>()
                      .add(UpdateData(profilImage: downloadUrl));
                });
              }
              return Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Color(0xFF5F558B), width: 1),
                    ),
                    child: Stack(
                      children: [
                        SpinKitFadingCircle(
                          color: accentColor2,
                          size: 50,
                        ),
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: (userState.userModels.profilePicture ==
                                          ""
                                      ? AssetImage('assets/icons/user_pic.png')
                                      : NetworkImage(
                                          userState.userModels.profilePicture)),
                                  fit: BoxFit.cover)),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width -
                            78 -
                            (2 * defaultMargin),
                        child: Text(
                          userState.userModels.name,
                          style: whiteTextFont.copyWith(fontSize: 18),
                          maxLines: 1,
                          overflow: TextOverflow.clip,
                        ),
                      ),
                      Text(
                        NumberFormat.currency(
                                locale: 'id_ID',
                                decimalDigits: 0,
                                symbol: "IDR ")
                            .format(userState.userModels.balance),
                        style: yellowNumberFont.copyWith(
                            fontSize: 14, fontWeight: FontWeight.w400),
                      )
                    ],
                  )
                ],
              );
            } else {
              return SpinKitFadingCircle(
                color: accentColor2,
                size: 50,
              );
            }
          }),
        ),
        // note: Now Playing
        Container(
          margin: EdgeInsets.fromLTRB(
              defaultMargin.toDouble(), 30, defaultMargin.toDouble(), 12),
          child: Text(
            "Now Playing",
            style: blackTextFont.copyWith(
                fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 140,
          child: BlocBuilder<MovieBloc, MovieState>(builder: (_, movieState) {
            if (movieState is MovieLoaded) {
              List<MovieModels> movies = movieState.movies.sublist(0, 10);

              return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: movies.length,
                  itemBuilder: (_, index) => Container(
                        margin: EdgeInsets.only(
                            left: (index == 0) ? defaultMargin.toDouble() : 0,
                            right: (index == movies.length - 1)
                                ? defaultMargin.toDouble()
                                : 16),
                        child: MovieCard(movies[index]),
                      ));
            } else {
              return SpinKitFadingCircle(
                color: mainColor,
                size: 50,
              );
            }
          }),
        ),
        // note: Browse Movie
        Container(
          margin: EdgeInsets.fromLTRB(
              defaultMargin.toDouble(), 30, defaultMargin.toDouble(), 12),
          child: Text(
            'Browse Movie',
            style: blackTextFont.copyWith(
                fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        BlocBuilder<UserBloc, UserState>(builder: (_, userState) {
          if (userState is UserLoaded) {
            return Container(
              margin:
                  EdgeInsets.symmetric(horizontal: defaultMargin.toDouble()),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                    userState.userModels.selectedGenres.length,
                    (index) => BrowseButton(
                        userState.userModels.selectedGenres[index])),
              ),
            );
          } else {
            return SpinKitFadingCircle(
              color: mainColor,
              size: 50,
            );
          }
        }),
        // note: Comming Soon
        Container(
          margin: EdgeInsets.fromLTRB(
              defaultMargin.toDouble(), 30, defaultMargin.toDouble(), 12),
          child: Text(
            'Coming Soon',
            style: blackTextFont.copyWith(
                fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 140,
          child: BlocBuilder<MovieBloc, MovieState>(builder: (_, movieState) {
            if (movieState is MovieLoaded) {
              List<MovieModels> movies = movieState.movies.sublist(10, 20);
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: movies.length,
                itemBuilder: (_, index) => Container(
                  margin: EdgeInsets.only(
                      left: (index == 0) ? defaultMargin.toDouble() : 0,
                      right: (index == movies.length - 1)
                          ? defaultMargin.toDouble()
                          : 16),
                  child: ComingSoonCard(movies[index]),
                ),
              );
            } else {
              return SpinKitFadingCircle(
                color: mainColor,
                size: 50,
              );
            }
          }),
        ),
        // note: Get Lucky Day
        Container(
          margin: EdgeInsets.fromLTRB(
              defaultMargin.toDouble(), 30, defaultMargin.toDouble(), 13),
          child: Text(
            'Get Lucky Day',
            style: blackTextFont.copyWith(
                fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        Column(
          children: dummyPromos
              .map((e) => Padding(
                    padding: EdgeInsets.fromLTRB(defaultMargin.toDouble(), 13,
                        defaultMargin.toDouble(), 16),
                    child: PromoCard(e),
                  ))
              .toList(),
        ),
        SizedBox(height: 100)
      ],
    );
  }
}
