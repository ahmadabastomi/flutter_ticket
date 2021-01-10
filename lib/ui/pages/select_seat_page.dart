part of 'pages.dart';

class SelectSeatPage extends StatefulWidget {
  final TicketModels ticketModels;
  SelectSeatPage(this.ticketModels);
  @override
  _SelectSeatPageState createState() => _SelectSeatPageState();
}

class _SelectSeatPageState extends State<SelectSeatPage> {
  List<String> selectedSeats = [];
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
            //note: Header
            Container(
              margin: EdgeInsets.fromLTRB(
                  defaultMargin.toDouble(), 18, defaultMargin.toDouble(), 30),
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: () {
                        context.read<PageBloc>().add(GoToSelectSchedulePage(
                            widget.ticketModels.movieDetailModels));
                      },
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          margin: EdgeInsets.only(right: 16),
                          child: Text(
                            widget.ticketModels.movieDetailModels.title,
                            style: blackTextFont.copyWith(
                                fontSize: 20, fontWeight: FontWeight.w400),
                            maxLines: 2,
                            overflow: TextOverflow.clip,
                            textAlign: TextAlign.end,
                          ),
                        ),
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(
                                  image: NetworkImage(imageBaseURL +
                                      "w154" +
                                      widget.ticketModels.movieDetailModels
                                          .backdropPath),
                                  fit: BoxFit.cover)),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            //note: Cinema Screen
            Container(
              height: 84,
              width: 277,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage('assets/icons/screen.png'),
              )),
            ),
            //note: Seats Cinema
            generateSeats(),
            //note: info seats
            Container(
              height: 20,
              margin: EdgeInsets.only(top: 23, bottom: 30),
              child: generateInfoSeats(),
            ),
            //note: Next Button
            Align(
              alignment: Alignment.topCenter,
              child: FloatingActionButton(
                onPressed: () {},
                elevation: 0,
                backgroundColor:
                    (selectedSeats.length > 0) ? mainColor : Color(0xFFE4E4E4),
                child: Icon(Icons.arrow_forward,
                    size: 24,
                    color: (selectedSeats.length > 0)
                        ? Colors.white
                        : Color(0xFFBEBEBE)),
              ),
            )
          ],
        ),
      )),
    );
  }

  Column generateSeats() {
    List<int> numberOfSeats = [3, 5, 5, 5, 5];
    List<Widget> widgets = [];
    for (int i = 0; i < numberOfSeats.length; i++) {
      widgets.add(Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
            numberOfSeats[i],
            (index) => Container(
                  width: 40,
                  height: 40,
                  margin: EdgeInsets.only(
                      right: (index < numberOfSeats[i] - 1) ? 16 : 0,
                      bottom: (i < numberOfSeats.length - 1) ? 16 : 0),
                  child: SelectableBox(
                    '${String.fromCharCode(i + 65)}${index + 1}',
                    width: 40,
                    height: 40,
                    textStyle: whiteTextFont.copyWith(color: Colors.black),
                    isEnabled: index != 0,
                    isSelected: selectedSeats
                        .contains("${String.fromCharCode(i + 65)}${index + 1}"),
                    onTap: () {
                      String seatNumber =
                          "${String.fromCharCode(i + 65)}${index + 1}";
                      setState(() {
                        if (selectedSeats.contains(seatNumber)) {
                          selectedSeats.remove(seatNumber);
                        } else {
                          selectedSeats.add(seatNumber);
                        }
                      });
                    },
                  ),
                )),
      ));
    }
    return Column(
      children: widgets,
    );
  }

  Row generateInfoSeats() {
    List<String> infoSeats = ["Available", "Booked", "Selected"];
    List<Widget> widgets = [];
    for (var nameInfo in infoSeats) {
      widgets.add(Container(
        width: 71,
        height: 20,
        margin: EdgeInsets.only(left: (nameInfo == "Available") ? 0 : 20),
        child: Row(
          children: [
            Container(
              height: 20,
              width: 20,
              margin: EdgeInsets.only(right: 8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(
                      color: (nameInfo == "Available")
                          ? Color(0xFFE4E4E4)
                          : Colors.transparent),
                  color: (nameInfo == "Available")
                      ? Colors.white
                      : (nameInfo == "Booked")
                          ? Color(0xFFE4E4E4)
                          : accentColor2),
            ),
            Text(nameInfo, style: greyTextFont.copyWith(fontSize: 10))
          ],
        ),
      ));
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: widgets,
    );
  }
}
