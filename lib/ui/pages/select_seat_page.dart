part of 'pages.dart';

class SelectSeatPage extends StatefulWidget {
  final TicketModels ticketModels;
  SelectSeatPage(this.ticketModels);
  @override
  _SelectSeatPageState createState() => _SelectSeatPageState();
}

class _SelectSeatPageState extends State<SelectSeatPage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context
            .read<PageBloc>()
            .add(GoToSelectSchedulePage(widget.ticketModels.movieDetailModels));
        return;
      },
      child: Scaffold(
          body: Container(
        color: Colors.white,
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(
                  defaultMargin.toDouble(), 18, defaultMargin.toDouble(), 30),
              height: 60,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: () {
                        context.read<PageBloc>().add(GoToSelectSchedulePage(widget.ticketModels.movieDetailModels));
                      },
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
