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

List<PromoModels> dummyPromos = [];
