part of 'pages.dart';

class SuccessPage extends StatefulWidget {
  final TicketModels ticketModels;
  final TicketTransactionModels ticketTransactionModels;

  SuccessPage(this.ticketModels, this.ticketTransactionModels);
  @override
  _SuccessPageState createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
  Future handleTicketOrder;
  Future handleTopUp;
  Future<void> processingTicketOrder(BuildContext context) async {
    Provider.of<UserBloc>(context, listen: false)
        .add(Purchase(widget.ticketTransactionModels.amount));
    Provider.of<TicketBloc>(context, listen: false).add(
        BuyTicket(widget.ticketModels, widget.ticketTransactionModels.userID));

    await TicketTransactionServices.saveTransaction(
        widget.ticketTransactionModels);
  }

  Future<void> processingTopUp() async {}
  @override
  void initState() {
    handleTicketOrder = processingTicketOrder(context);
    handleTopUp = processingTopUp();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future:
              (widget.ticketModels != null) ? handleTicketOrder : handleTopUp,
          builder: (_, snapshot) => (snapshot.connectionState ==
                  ConnectionState.done)
              ? Container(
                  color: Colors.white,
                  margin: EdgeInsets.only(top: 86),
                  child: ListView(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 150,
                            height: 150,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/icons/ticket_done.png'),
                                    fit: BoxFit.cover)),
                          ),
                          SizedBox(
                            height: 89,
                          ),
                          Text(
                            'Happy Watching',
                            style: blackTextFont.copyWith(
                                fontSize: 20, fontWeight: FontWeight.w600),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Text(
                            'You have successfully\n bought the ticket',
                            style: greyTextFont.copyWith(
                                fontSize: 16, fontWeight: FontWeight.w300),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 70,
                          ),
                          Container(
                            width: 250,
                            height: 45,
                            child: RaisedButton(
                              onPressed: () {},
                              color: mainColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              child: Text(
                                'My Tickets',
                                style: whiteTextFont.copyWith(fontSize: 16),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Discover new movie? ',
                                style: greyTextFont.copyWith(
                                    fontSize: 14, fontWeight: FontWeight.w300),
                              ),
                              GestureDetector(
                                onTap: () {
                                  context.read<PageBloc>().add(GoToMainPage());
                                },
                                child: Text(
                                  'Back to Home',
                                  style: whiteTextFont.copyWith(
                                      color: mainColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                ),
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                )
              : Center(
                  child: SpinKitFadingCircle(
                    color: mainColor,
                    size: 50,
                  ),
                ),
        ),
      ),
    );
  }
}
