part of 'models.dart';

class MovieDetailModels extends MovieModels {
  final List<String> genres;
  final String language;

  MovieDetailModels(MovieModels movieModels, {this.genres, this.language})
      : super(
            id: movieModels.id,
            title: movieModels.title,
            overview: movieModels.overview,
            voteAverage: movieModels.voteAverage,
            backdropPath: movieModels.backdropPath,
            posterPath: movieModels.posterPath);

  String get genresLanguage {
    String s = "";
    for (var genre in genres) {
      s += genre + ((genre != genres.last) ? ', ' : '');
    }
    return "$s - $language";
  }

  @override
  List<Object> get props => [genres, language];
}
