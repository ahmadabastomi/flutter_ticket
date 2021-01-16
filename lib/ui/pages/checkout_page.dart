part of 'pages.dart';

class CheckoutPage extends StatefulWidget {
  final TicketModels ticketModels;
  CheckoutPage(this.ticketModels);
  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  @override
  Widget build(BuildContext context) {
    int totalPrice = 26500 * widget.ticketModels.seats.length;
    return WillPopScope(
      onWillPop: () async {
        context.read<PageBloc>().add(GoToSelectSeatPage(widget.ticketModels));
        return;
      },
      child: Scaffold(
        body: Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: defaultMargin.toDouble()),
          child: ListView(
            children: [
              Column(
                children: [
                  //note: Title Checkout Movie
                  Container(
                    margin: EdgeInsets.only(top: 20, bottom: 20),
                    height: 56,
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: GestureDetector(
                            onTap: () {
                              context
                                  .read<PageBloc>()
                                  .add(GoToSelectSeatPage(widget.ticketModels));
                            },
                            child: Icon(
                              Icons.arrow_back,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topCenter,
                          child: Text(
                            "Checkout\n Movie",
                            style: blackTextFont.copyWith(
                                fontSize: 20, fontWeight: FontWeight.w600),
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                  ),
                  //note: Detail Movie
                  Container(
                    height: 90,
                    margin: EdgeInsets.only(bottom: 20),
                    child: Row(
                      children: [
                        Container(
                          width: 70,
                          height: 90,
                          margin: EdgeInsets.only(right: 20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(
                                  image: NetworkImage(imageBaseURL +
                                      "w154" +
                                      widget.ticketModels.movieDetailModels
                                          .posterPath),
                                  fit: BoxFit.cover)),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width -
                                  2 * defaultMargin -
                                  70 -
                                  20,
                              child: Text(
                                widget.ticketModels.movieDetailModels.title,
                                style: blackTextFont.copyWith(
                                    fontSize: 18, fontWeight: FontWeight.w600),
                                maxLines: 2,
                                overflow: TextOverflow.clip,
                              ),
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width -
                                  2 * defaultMargin -
                                  70 -
                                  20,
                              child: Text(
                                widget.ticketModels.movieDetailModels
                                    .genresLanguage,
                                style: greyTextFont.copyWith(
                                    fontSize: 12, fontWeight: FontWeight.w300),
                                maxLines: 2,
                                overflow: TextOverflow.clip,
                              ),
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            RatingStarts(
                              voteAverage: widget
                                  .ticketModels.movieDetailModels.voteAverage,
                              labelColor: Color(0xFFADADAD),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Divider(
                    thickness: 1,
                    color: Color(0xFFE4E4E4),
                  ),
                  BlocBuilder<UserBloc, UserState>(
                      builder: (_, userState) => Container(
                          margin: EdgeInsets.only(top: 20),
                          child: Column(
                            children: [
                              //note: ID Order
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'ID Order',
                                    style: greyTextFont.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w300),
                                  ),
                                  Text(
                                    widget.ticketModels.bookingCode,
                                    style: blackTextFont.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w300),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 9,
                              ),
                              //note: Place Cinema
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Cinema',
                                    style: greyTextFont.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w300),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.55,
                                    child: Text(
                                      widget.ticketModels.theaterModels.name,
                                      style: blackTextFont.copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w300),
                                      textAlign: TextAlign.right,
                                      overflow: TextOverflow.clip,
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 9,
                              ),
                              //note: Date and Time
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Date & Time',
                                    style: greyTextFont.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w300),
                                  ),
                                  Text(
                                    widget.ticketModels.time.dateAndTime,
                                    style: blackTextFont.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w300),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 9,
                              ),
                              //note: Seat Position
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.baseline,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Seat Number",
                                    style: greyTextFont.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w300),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.55,
                                    child: Text(
                                      widget.ticketModels.seatsInString,
                                      style: blackTextFont.copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w300),
                                      textAlign: TextAlign.right,
                                      overflow: TextOverflow.clip,
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 9,
                              ),
                              //note: Price
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Price",
                                      style: greyTextFont.copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w300)),
                                  Text(
                                    "IDR 25.000 x ${widget.ticketModels.seats.length}",
                                    style: blackTextFont.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w300),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 9,
                              ),
                              //note: Fee
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Fee",
                                    style: greyTextFont.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w300),
                                  ),
                                  Text(
                                    "IDR 1.500 x ${widget.ticketModels.seats.length}",
                                    style: blackTextFont.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w300),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 9,
                              ),
                              //note: Total
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Total",
                                    style: greyTextFont.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w300),
                                  ),
                                  Text(
                                    NumberFormat.currency(
                                            locale: 'id_ID',
                                            decimalDigits: 0,
                                            symbol: 'IDR ')
                                        .format(totalPrice),
                                    style: blackTextFont.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Divider(
                                color: Color(0xFFE4E4E4),
                                thickness: 1,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              //note: Your Wallet
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Your Wallet",
                                    style: greyTextFont.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w300),
                                  ),
                                  Text(
                                    NumberFormat.currency(
                                      locale: 'id_ID',
                                      decimalDigits: 0,
                                      symbol: "IDR ",
                                    ).format((userState as UserLoaded)
                                        .userModels
                                        .balance),
                                    style: greyTextFont.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 36,
                              ),
                              Center(
                                child: Container(
                                  width: 250,
                                  height: 45,
                                  child: RaisedButton(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      onPressed: () {
                                        if (totalPrice <=
                                            (userState as UserLoaded)
                                                .userModels
                                                .balance) {
                                          TicketTransactionModels transaction =
                                              TicketTransactionModels(
                                                  userID:
                                                      (userState as UserLoaded)
                                                          .userModels
                                                          .id,
                                                  title: widget.ticketModels
                                                      .movieDetailModels.title,
                                                  subtitle: widget.ticketModels
                                                      .theaterModels.name,
                                                  time: DateTime.now(),
                                                  amount: totalPrice,
                                                  picture: widget
                                                      .ticketModels
                                                      .movieDetailModels
                                                      .posterPath);

                                          context.read<PageBloc>().add(
                                              GoToSuccesspage(
                                                  widget.ticketModels.copyWith(
                                                      totalPrice: totalPrice),
                                                  transaction));
                                        } else {
                                          context.read<PageBloc>().add(
                                              GoToTopUpPage(GoToCheckoutPage(
                                                  widget.ticketModels)));
                                        }
                                      },
                                      color: (totalPrice <=
                                              ((userState as UserLoaded)
                                                  .userModels
                                                  .balance))
                                          ? Color(0xFF3E9D9D)
                                          : mainColor,
                                      child: Text(
                                          (totalPrice <=
                                                  (userState as UserLoaded)
                                                      .userModels
                                                      .balance)
                                              ? "Checkout Now"
                                              : "Top Up Now",
                                          style: whiteTextFont.copyWith(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ))),
                                ),
                              ),
                              SizedBox(
                                height: 44,
                              )
                            ],
                          )))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
