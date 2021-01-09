part of 'widgets.dart';

class CreditCard extends StatelessWidget {
  final CreditModels creditModels;
  CreditCard(this.creditModels);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      width: 70,
      child: Column(
        children: [
          Container(
            width: 70,
            height: 80,
            margin: EdgeInsets.only(bottom: 6),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                    image: (creditModels.profilePath == null)
                        ? AssetImage('assets/icons/user_pic.png')
                        : NetworkImage(
                            imageBaseURL + "w780" + creditModels.profilePath),
                    fit: BoxFit.cover)),
          ),
          Text(
            "${creditModels.name}",
            style: blackTextFont.copyWith(
                fontSize: 10, fontWeight: FontWeight.w300),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
