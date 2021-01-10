part of 'pages.dart';

class SelectSchedulePage extends StatefulWidget {
  final MovieDetailModels movieDetailModels;
  SelectSchedulePage(this.movieDetailModels);
  @override
  _SelectSchedulePageState createState() => _SelectSchedulePageState();
}

class _SelectSchedulePageState extends State<SelectSchedulePage> {
  List<DateTime> dates;
  DateTime selectedDate;
  int selectedTime;
  TheaterModels selectedTheater;
  bool isValid = false;

  @override
  void initState() {
    super.initState();
    dates =
        List.generate(7, (index) => DateTime.now().add(Duration(days: index)));
    selectedDate = dates[0];
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context
            .read<PageBloc>()
            .add(GoToMovieDetailPage(widget.movieDetailModels));
        return;
      },
      child: Scaffold(
        body: Container(
          color: Colors.white,
          child: SafeArea(
            child: ListView(
              children: [
                //note: Arrow Back Button
                Container(
                  alignment: Alignment.topLeft,
                  margin:
                      EdgeInsets.only(top: 36, left: defaultMargin.toDouble()),
                  child: GestureDetector(
                    onTap: () {
                      context
                          .read<PageBloc>()
                          .add(GoToMovieDetailPage(widget.movieDetailModels));
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
                  ),
                ),
                //note: Choose Date
                Container(
                  margin: EdgeInsets.fromLTRB(defaultMargin.toDouble(), 20,
                      defaultMargin.toDouble(), 16),
                  child: Text(
                    'Choose Date',
                    style: blackTextFont.copyWith(
                        fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 24),
                  height: 90,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: dates.length,
                    itemBuilder: (_, index) => Container(
                      margin: EdgeInsets.only(
                          left: (index == 0) ? defaultMargin.toDouble() : 0,
                          right: (dates.length - 1 == index)
                              ? defaultMargin.toDouble()
                              : 16),
                      child: DateCard(
                        dates[index],
                        isSelected: (selectedDate == dates[index]),
                        onTap: () {
                          setState(() {
                            selectedDate = dates[index];
                          });
                        },
                      ),
                    ),
                  ),
                ),
                //note: Choose Theater and Time
                generateTheaterTimeTable(),
                //note: Next Button
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: BlocBuilder<UserBloc, UserState>(
                    builder: (_, userState) => FloatingActionButton(
                      onPressed: () {
                        if (isValid) {
                          context.read<PageBloc>().add(GoToSelectSeatPage(
                              TicketModels(
                                  widget.movieDetailModels,
                                  selectedTheater,
                                  DateTime(
                                      selectedDate.year,
                                      selectedDate.month,
                                      selectedDate.day,
                                      selectedTime),
                                  randomAlphaNumeric(12).toUpperCase(),
                                  null,
                                  (userState as UserLoaded).userModels.name,
                                  null)));
                        }
                      },
                      elevation: 0,
                      backgroundColor:
                          (isValid) ? mainColor : Color(0xFFE4E4E4),
                      child: Icon(Icons.arrow_forward,
                          size: 24,
                          color: (isValid) ? Colors.white : Color(0xFFBEBEBE)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column generateTheaterTimeTable() {
    List<int> schedule = List.generate(7, (index) => 10 + index * 2);
    List<Widget> widgets = [];
    for (var theater in dummyTheaters) {
      widgets.add(Container(
        margin: EdgeInsets.fromLTRB(
            defaultMargin.toDouble(), 0, defaultMargin.toDouble(), 16),
        child: Text(
          theater.name,
          style: blackTextFont.copyWith(fontSize: 20),
        ),
      ));
      widgets.add(Container(
          height: 50,
          margin: EdgeInsets.only(bottom: 20),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: schedule.length,
            itemBuilder: (_, index) => Container(
              margin: EdgeInsets.only(
                  left: (index == 0) ? defaultMargin.toDouble() : 0,
                  right: (schedule.length - 1 == index)
                      ? defaultMargin.toDouble()
                      : 16),
              child: SelectableBox(
                "${schedule[index]}:00",
                height: 50,
                width: 90,
                isSelected: (selectedTheater == theater &&
                    selectedTime == schedule[index]),
                isEnabled: (schedule[index] > DateTime.now().hour ||
                    selectedDate.day != DateTime.now().day),
                onTap: () {
                  setState(() {
                    selectedTheater = theater;
                    selectedTime = schedule[index];
                    isValid = true;
                  });
                },
              ),
            ),
          )));
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: widgets,
    );
  }
}
