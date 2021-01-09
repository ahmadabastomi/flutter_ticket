part of 'widgets.dart';

class DateCard extends StatelessWidget {
  final DateTime date;
  final bool isSelected;
  final double height;
  final double width;
  final Function onTap;
  DateCard(this.date,
      {this.isSelected = false, this.height = 90, this.width = 70, this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          if (onTap != null) {
            onTap();
          }
        },
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
              border: Border.all(
                  color: (isSelected) ? Colors.transparent : Color(0xFFE4E4E4)),
              borderRadius: BorderRadius.circular(6),
              color: (isSelected) ? accentColor2 : Colors.transparent),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                date.shortDayName.toString(),
                style: blackTextFont.copyWith(
                    fontSize: 16, fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 6,
              ),
              Text(
                date.day.toString(),
                style: whiteTextFont.copyWith(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              )
            ],
          ),
        ));
  }
}
