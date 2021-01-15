part of 'pages.dart';

class TopUpPage extends StatefulWidget {
  final PageEvent pageEvent;
  TopUpPage(this.pageEvent);
  @override
  _TopUpPageState createState() => _TopUpPageState();
}

class _TopUpPageState extends State<TopUpPage> {
  TextEditingController amountController = TextEditingController(text: "IDR 0");
  int selectedAmount = 0;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        context.read<PageBloc>().add(widget.pageEvent);
        return;
      },
      child: Scaffold(
          body: Container(
        child: ListView(
          children: [
            //note: Header
            Container(
              margin: EdgeInsets.only(top: 20, left: defaultMargin.toDouble()),
              height: 56,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: () {
                        context.read<PageBloc>().add(widget.pageEvent);
                      },
                      child: Icon(Icons.arrow_back),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Top Up',
                      style: blackTextFont.copyWith(
                          fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding:
                  EdgeInsets.symmetric(horizontal: defaultMargin.toDouble()),
              child: Theme(
                data: Theme.of(context).copyWith(primaryColor: accentColor2),
                child: TextField(
                  onChanged: (text) {
                    String temp = '';
                    for (int i = 0; i < text.length; i++) {
                      temp += text.isDigit(i) ? text[i] : '';
                    }
                    setState(() {
                      selectedAmount = int.tryParse(temp) ?? 0;
                    });

                    amountController.text = NumberFormat.currency(
                      locale: 'id_ID',
                      decimalDigits: 0,
                      symbol: 'IDR ',
                    ).format(selectedAmount);

                    amountController.selection = TextSelection.fromPosition(
                        TextPosition(offset: amountController.text.length));
                  },
                  controller: amountController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: 'Amount',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: accentColor2)),
                      floatingLabelBehavior: FloatingLabelBehavior.always),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  top: 20,
                  left: defaultMargin.toDouble(),
                  right: defaultMargin.toDouble(),
                  bottom: 15),
              child: Text('Choose by Template',
                  style: blackTextFont.copyWith(
                      fontSize: 14, fontWeight: FontWeight.w500)),
            ),
            Container(
              margin:
                  EdgeInsets.symmetric(horizontal: defaultMargin.toDouble()),
              child: Wrap(
                spacing: 20,
                runSpacing: 14,
                children: generateMoneyWidget(context),
              ),
            ),
            SizedBox(
              height: 100,
            ),
            Center(
              child: Container(
                width: 250,
                height: 45,
                child:
                    BlocBuilder<UserBloc, UserState>(builder: (_, userState) {
                  if (userState is UserLoaded) {
                    return RaisedButton(
                      onPressed: () {},
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      color: accentColor3,
                      child: Text(
                        'Top Up Now',
                        style: whiteTextFont.copyWith(fontSize: 16),
                      ),
                    );
                  } else {
                    return SpinKitFadingCircle(
                      color: accentColor3,
                      size: 50,
                    );
                  }
                }),
              ),
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      )),
    );
  }

  List<Widget> generateMoneyWidget(BuildContext context) {
    List<int> listTopUpValue = [
      50000,
      100000,
      150000,
      200000,
      250000,
      500000,
      1000000,
      2500000,
      5000000
    ];
    double width =
        (MediaQuery.of(context).size.width - 2 * defaultMargin - 40) / 3;
    return listTopUpValue
        .map((e) => MoneyCard(
              amount: e,
              width: width,
              isSelected: e == selectedAmount,
              onTap: () {
                setState(() {
                  if (selectedAmount != e) {
                    selectedAmount = e;
                  } else {
                    selectedAmount = 0;
                  }
                  amountController.text = NumberFormat.currency(
                          locale: 'id_iD', decimalDigits: 0, symbol: 'IDR ')
                      .format(selectedAmount);
                  amountController.selection = TextSelection.fromPosition(
                      TextPosition(offset: amountController.text.length));
                });
              },
            ))
        .toList();
  }
}
