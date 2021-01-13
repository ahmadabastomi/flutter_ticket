part of 'pages.dart';

class TicketPage extends StatefulWidget {
  @override
  _TicketPageState createState() => _TicketPageState();
}

class _TicketPageState extends State<TicketPage> {
  bool isExpiredTicket = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: mainColor,
      child: SafeArea(
        child: Stack(
          children: [
            //note: Content
            BlocBuilder<TicketBloc, TicketState>(
                builder: (_, ticketState) => Container(
                      color: Colors.white,
                      child: TicketViewer((isExpiredTicket)
                          ? ticketState.tickets
                              .where((ticket) =>
                                  ticket.time.isBefore(DateTime.now()))
                              .toList()
                          : ticketState.tickets
                              .where((ticket) =>
                                  ticket.time.isAfter(DateTime.now()))
                              .toList()),
                    )),
            //note: Header
            ClipPath(
              clipper: HeaderClipper(),
              child: Container(
                height: 110,
                decoration: BoxDecoration(
                    color: accentColor1,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          left: defaultMargin.toDouble(), bottom: 32),
                      child: Text('My Tickets',
                          style: whiteTextFont.copyWith(
                              fontSize: 20, fontWeight: FontWeight.w600)),
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            if (isExpiredTicket == true) {
                              setState(() {
                                isExpiredTicket = !isExpiredTicket;
                              });
                            }
                          },
                          child: Column(
                            children: [
                              Text(
                                'Newest',
                                style: whiteTextFont.copyWith(
                                    color: (isExpiredTicket)
                                        ? Color(0xFF6F678E)
                                        : Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Container(
                                  height: 4,
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  color: (isExpiredTicket)
                                      ? Colors.transparent
                                      : accentColor2)
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            if (isExpiredTicket == false) {
                              setState(() {
                                isExpiredTicket = !isExpiredTicket;
                              });
                            }
                          },
                          child: Column(
                            children: [
                              Text('Oldest',
                                  style: whiteTextFont.copyWith(
                                      color: (isExpiredTicket)
                                          ? Colors.white
                                          : Color(0xFF6F678E),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400)),
                              SizedBox(
                                height: 15,
                              ),
                              Container(
                                  height: 4,
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  color: (isExpiredTicket)
                                      ? accentColor2
                                      : Colors.transparent)
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}

class HeaderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 20);
    path.quadraticBezierTo(0, size.height, 20, size.height);
    path.lineTo(size.width - 20, size.height);
    path.quadraticBezierTo(
        size.width, size.height, size.width, size.height - 20);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

class TicketViewer extends StatelessWidget {
  final List<TicketModels> ticketsList;
  TicketViewer(this.ticketsList);
  @override
  Widget build(BuildContext context) {
    var sortedTickets = ticketsList;
    sortedTickets
        .sort((ticket1, ticket2) => ticket1.time.compareTo(ticket2.time));
    return Container(
      margin: EdgeInsets.symmetric(horizontal: defaultMargin.toDouble()),
      child: ListView.builder(
        itemCount: sortedTickets.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (_, index) => Container(
          margin: EdgeInsets.only(top: (index == 0) ? 133 : 20),
          child: Row(
            children: [
              Container(
                width: 70,
                height: 90,
                margin: EdgeInsets.only(right: 16),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(imageBaseURL +
                            "w154" +
                            sortedTickets[index].movieDetailModels.posterPath),
                        fit: BoxFit.fill)),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width -
                    2 * defaultMargin -
                    70 -
                    16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      sortedTickets[index].movieDetailModels.title,
                      style: blackTextFont.copyWith(
                          fontSize: 18, fontWeight: FontWeight.w400),
                      textAlign: TextAlign.left,
                      maxLines: 2,
                      overflow: TextOverflow.clip,
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      sortedTickets[index].movieDetailModels.genresLanguage,
                      style: greyTextFont.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                      ),
                      textAlign: TextAlign.left,
                      maxLines: 2,
                      overflow: TextOverflow.clip,
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      sortedTickets[index].theaterModels.name,
                      style: greyTextFont.copyWith(
                          fontSize: 12, fontWeight: FontWeight.w300),
                      textAlign: TextAlign.left,
                      maxLines: 2,
                      overflow: TextOverflow.clip,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
