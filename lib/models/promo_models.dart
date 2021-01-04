part of 'models.dart';

class PromoModels extends Equatable {
  final String title;
  final String subtitle;
  final int discount;

  PromoModels(
      {@required this.title, @required this.subtitle, @required this.discount});
  @override
  List<Object> get props => [title, subtitle, discount];
}

List<PromoModels> dummyPromos = [
  PromoModels(title: "Student Holyday", subtitle: "Maximal only for two people", discount: 50),
  PromoModels(title: "Family Club", subtitle: "Minimal for three members", discount: 70),
  PromoModels(title: "Subscription Promo ", subtitle: "Min. one year", discount: 40)
];
