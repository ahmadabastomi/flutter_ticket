part of 'models.dart';

class TheaterModels extends Equatable {
  final String name;
  TheaterModels(this.name);
  @override
  List<Object> get props => [name];
}

List<TheaterModels> dummyTheaters = [
  TheaterModels('CGV 23 Paskal Hyper Square'),
  TheaterModels('CGV Paris Van Java'),
  TheaterModels('XXI Cihampelas Walk'),
  TheaterModels('XXI Bandung Trade Center')
];
