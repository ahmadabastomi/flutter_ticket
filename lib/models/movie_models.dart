part of 'models.dart';

class MovieModels extends Equatable {
  final int id;
  final String title;
  final double voteAverage;
  final String overview;
  final String posterPath;
  final String backdropPath;

  MovieModels(
      {@required this.id,
      @required this.title,
      @required this.voteAverage,
      @required this.overview,
      @required this.posterPath,
      @required this.backdropPath});

  factory MovieModels.fromJson(Map<String, dynamic> json) => MovieModels(
      id: json['id'],
      title: json['title'],
      voteAverage: (json['vote_average'] as num).toDouble(),
      overview: json['overview'],
      backdropPath: json['backdrop_path'],
      posterPath: json['poster_path']);
  @override
  List<Object> get props =>
      [id, title, voteAverage, overview, posterPath, backdropPath];
}
