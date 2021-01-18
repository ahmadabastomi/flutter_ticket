part of 'pages.dart';

class TicketDetailPage extends StatelessWidget {
  final TicketModels ticketModels;
  TicketDetailPage(this.ticketModels);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        context.read<PageBloc>().add(GoToMainPage(
            bottomNavbarIndex: 1,
            isExpiredTicket: ticketModels.time.isBefore(DateTime.now())));
        return;
      },
      child: Scaffold(
        body: SafeArea(
          child: Container(
              padding:
                  EdgeInsets.symmetric(horizontal: defaultMargin.toDouble()),
              color: Color(0xFFE5E5E5),
              child: ListView(
                children: [
                  //note: Header
                  Container(
                    margin: EdgeInsets.only(
                      top: 20,
                    ),
                    height: 56,
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: GestureDetector(
                            onTap: () {
                              context.read<PageBloc>().add(GoToMainPage(
                                  bottomNavbarIndex: 1,
                                  isExpiredTicket: ticketModels.time
                                      .isBefore(DateTime.now())));
                            },
                            child: Icon(
                              Icons.arrow_back,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Ticket Details',
                            style: blackTextFont.copyWith(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                        )
                      ],
                    ),
                  ),
                  //note: Content Ticket Details
                  ClipPath(
                    clipper: TicketClipper(),
                    child: Container(
                      width:
                          MediaQuery.of(context).size.width - 2 * defaultMargin,
                      margin: EdgeInsets.only(bottom: 22, top: 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      child: Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width -
                                2 * defaultMargin,
                            height: 170,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(8),
                                    topRight: Radius.circular(8)),
                                image: DecorationImage(
                                    image: NetworkImage(imageBaseURL +
                                        "w780" +
                                        ticketModels
                                            .movieDetailModels.backdropPath),
                                    fit: BoxFit.cover)),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                top: 16,
                                left: defaultMargin.toDouble(),
                                right: defaultMargin.toDouble()),
                            child: Column(
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width -
                                      2 * defaultMargin -
                                      40,
                                  child: Text(
                                    ticketModels.movieDetailModels.title,
                                    style: blackTextFont.copyWith(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400),
                                    maxLines: 2,
                                    overflow: TextOverflow.clip,
                                  ),
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    ticketModels
                                        .movieDetailModels.genresLanguage,
                                    style: greyTextFont.copyWith(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                RatingStarts(
                                  voteAverage: ticketModels
                                      .movieDetailModels.voteAverage,
                                  labelColor: Color(0xFFADADAD),
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Cinema',
                                      style: greyTextFont.copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    SizedBox(
                                      width:
                                          (MediaQuery.of(context).size.width -
                                                  2 * defaultMargin -
                                                  40) *
                                              0.55,
                                      child: Text(
                                        ticketModels.theaterModels.name,
                                        style: blackTextFont.copyWith(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400),
                                        maxLines: 2,
                                        overflow: TextOverflow.clip,
                                        textAlign: TextAlign.right,
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Date & Time',
                                      style: greyTextFont.copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      ticketModels.time.dateAndTime,
                                      style: blackTextFont.copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Seat Number',
                                        style: greyTextFont.copyWith(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400)),
                                    SizedBox(
                                      width:
                                          (MediaQuery.of(context).size.width -
                                                  2 * defaultMargin -
                                                  40) *
                                              0.55,
                                      child: Text(
                                        ticketModels.seatsInString,
                                        style: blackTextFont.copyWith(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400),
                                        textAlign: TextAlign.right,
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('ID Order',
                                        style: greyTextFont.copyWith(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400)),
                                    Text(
                                      ticketModels.bookingCode,
                                      style: blackTextFont.copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                // Divider(
                                //   color: Color(0xFFE4E4E4),
                                //   thickness: 1,
                                // ),
                                Dash(
                                  length: MediaQuery.of(context).size.width -
                                      2 * defaultMargin -
                                      50,
                                  dashColor: Color(0xFFE4E4E4),
                                ),
                                SizedBox(
                                  height: 23,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Name',
                                          style: greyTextFont.copyWith(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        Text(ticketModels.name,
                                            style: blackTextFont.copyWith(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400)),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Text(
                                          'Paid',
                                          style: greyTextFont.copyWith(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        Text(
                                          NumberFormat.currency(
                                                  locale: 'id_ID',
                                                  decimalDigits: 0,
                                                  symbol: 'IDR ')
                                              .format(ticketModels.totalPrice),
                                          style: blackTextFont.copyWith(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        )
                                      ],
                                    ),
                                    QrImage(
                                      data: ticketModels.bookingCode,
                                      size: 100,
                                      version: QrVersions.auto,
                                    )
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }
}

class TicketClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 169);
    path.quadraticBezierTo(20, size.height - 169, 20, size.height - 149);
    path.quadraticBezierTo(20, size.height - 129, 0, size.height - 129);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, size.height - 129);
    path.quadraticBezierTo(
        size.width - 20, size.height - 129, size.width - 20, size.height - 149);
    path.quadraticBezierTo(
        size.width - 20, size.height - 169, size.width, size.height - 169);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) => false;
}
