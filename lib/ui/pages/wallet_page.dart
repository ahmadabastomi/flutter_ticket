part of 'pages.dart';

class WalletPage extends StatelessWidget {
  final PageEvent pageEvent;
  WalletPage(this.pageEvent);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        context.read<PageBloc>().add(pageEvent);
        return;
      },
      child: Scaffold(
          body: SafeArea(
              child: Stack(
        children: [
          Container(
            child: ListView(
              children: [
                //note: Header
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
                              context.read<PageBloc>().add(pageEvent);
                            },
                            child: Icon(Icons.arrow_back)),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text('My Wallet',
                            style: blackTextFont.copyWith(
                                fontSize: 20, fontWeight: FontWeight.w600)),
                      )
                    ],
                  ),
                ),
                //note: Card
                BlocBuilder<UserBloc, UserState>(
                    builder: (_, userState) => Column(
                          children: [
                            Container(
                                height: 185,
                                width: double.infinity,
                                margin: EdgeInsets.symmetric(
                                    horizontal: defaultMargin.toDouble()),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    color: Color(0xFF382A74),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black,
                                          blurRadius: 10,
                                          spreadRadius: 0,
                                          offset: Offset(0, 5))
                                    ]),
                                child: Stack(
                                  children: [
                                    ClipPath(
                                      clipper: CardClipper(),
                                      child: Container(
                                        height: 186,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(16),
                                            gradient: LinearGradient(
                                                begin: Alignment.bottomRight,
                                                end: Alignment.topLeft,
                                                colors: [
                                                  Colors.white.withOpacity(0.1),
                                                  Colors.white.withOpacity(0)
                                                ])),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(20),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                height: 18,
                                                width: 18,
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Color(0xFFFFF2CB)),
                                              ),
                                              Container(
                                                margin:
                                                    EdgeInsets.only(left: 4),
                                                width: 30,
                                                height: 30,
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Color(0xFFFBD460)),
                                              )
                                            ],
                                          ),
                                          Text(
                                              NumberFormat.currency(
                                                      locale: 'id_ID',
                                                      decimalDigits: 0,
                                                      symbol: 'IDR ')
                                                  .format(
                                                      (userState as UserLoaded)
                                                          .userModels
                                                          .balance),
                                              style: whiteTextFont.copyWith(
                                                  fontSize: 28,
                                                  fontWeight: FontWeight.w600)),
                                          Row(
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text('Card Holder',
                                                      style: whiteTextFont
                                                          .copyWith(
                                                              fontSize: 10,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400)),
                                                  SizedBox(
                                                    height: 4,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                          (userState
                                                                  as UserLoaded)
                                                              .userModels
                                                              .name,
                                                          style: whiteTextFont
                                                              .copyWith(
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600)),
                                                      Container(
                                                        margin: EdgeInsets.only(
                                                            left: 4),
                                                        width: 14,
                                                        height: 14,
                                                        decoration: BoxDecoration(
                                                            image: DecorationImage(
                                                                image: AssetImage(
                                                                    'assets/icons/ic_check.png'),
                                                                fit: BoxFit
                                                                    .cover)),
                                                      )
                                                    ],
                                                  )
                                                ],
                                              ),
                                              SizedBox(
                                                width: 30,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text('Card ID',
                                                      style: whiteTextFont
                                                          .copyWith(
                                                              fontSize: 10,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400)),
                                                  SizedBox(
                                                    height: 4,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                          (userState
                                                                  as UserLoaded)
                                                              .userModels
                                                              .id
                                                              .substring(0, 10),
                                                          style: whiteTextFont
                                                              .copyWith(
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600)),
                                                      Container(
                                                        margin: EdgeInsets.only(
                                                            left: 4),
                                                        width: 14,
                                                        height: 14,
                                                        decoration: BoxDecoration(
                                                            image: DecorationImage(
                                                                image: AssetImage(
                                                                    'assets/icons/ic_check.png'),
                                                                fit: BoxFit
                                                                    .cover)),
                                                      )
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                )),
                            Container(
                              alignment: Alignment.centerLeft,
                              margin: EdgeInsets.only(
                                  left: defaultMargin.toDouble(),
                                  top: 20,
                                  bottom: 12),
                              child: Text(
                                'Recent Transaction',
                                style: blackTextFont.copyWith(
                                    fontSize: 14, fontWeight: FontWeight.w500),
                              ),
                            ),
                            FutureBuilder(
                              future: TicketTransactionServices.getTransactions(
                                  (userState as UserLoaded).userModels.id),
                              builder: (_, snapshot) {
                                if (snapshot.hasData) {
                                  return generateTransactionList(snapshot.data,context);
                                } else {
                                  return SpinKitFadingCircle(
                                    color: mainColor,
                                    size: 50,
                                  );
                                }
                              },
                            ),
                            SizedBox(
                              height: 50,
                            )
                          ],
                        ))
              ],
            ),
          ),
          //note: Button
          Container(
            margin: EdgeInsets.only(bottom: 20),
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              width: 46,
              height: 46,
              child: FloatingActionButton(
                onPressed: () {
                  context.read<PageBloc>().add(GoToTopUpPage(GoToWalletPage(pageEvent)));
                },
                backgroundColor: Color(0xFFFBD460),
                child: Container(
                  width: 26,
                  height: 26,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/icons/top_up.png'),
                          fit: BoxFit.cover)),
                ),
              ),
            ),
          )
        ],
      ))),
    );
  }

  Column generateTransactionList(
      List<TicketTransactionModels> transactions, BuildContext context) {
    var sortedTransactions = transactions;
    sortedTransactions.sort((transaction1, transaction2) =>
        transaction2.time.compareTo(transaction1.time));
    return Column(
      children: sortedTransactions
          .map((e) => Container(
                width: MediaQuery.of(context).size.width - 2 * defaultMargin,
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          left: defaultMargin.toDouble(),
                          right: defaultMargin.toDouble(),
                          top: 10),
                      width: 70,
                      height: 90,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                              image: (e.picture != null)
                                  ? NetworkImage(
                                      imageBaseURL + "w154" + e.picture)
                                  : AssetImage('assets/icons/bg_topup.png'),
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
                              16 - 32,
                          child: Text(
                            e.title,
                            style: blackTextFont.copyWith(
                                fontSize: 18, fontWeight: FontWeight.w400),
                            maxLines: 2,
                            overflow: TextOverflow.clip,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          NumberFormat.currency(
                                  locale: 'id_ID',
                                  decimalDigits: 0,
                                  symbol: 'IDR ')
                              .format(e.amount),
                          style: blackTextFont.copyWith(
                              fontSize: 12, fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          e.subtitle,
                          style: greyTextFont.copyWith(
                              fontSize: 12, fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                  ],
                ),
              ))
          .toList(),
    );
  }
}

class CardClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
