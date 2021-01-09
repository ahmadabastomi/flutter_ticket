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
                      EdgeInsets.only(top: 16, left: defaultMargin.toDouble()),
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
