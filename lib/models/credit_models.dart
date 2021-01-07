part of 'models.dart';

class CreditModels extends Equatable {
  final String name;
  final String profilePath;

  CreditModels({this.name, this.profilePath});

  @override
  List<Object> get props => [name, profilePath];
}
