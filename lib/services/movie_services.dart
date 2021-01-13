part of 'services.dart';

class MovieServices {
  static Future<List<MovieModels>> getMovies(int page,
      {http.Client client}) async {
    String url =
        "https://api.themoviedb.org/3/discover/movie?api_key=$apiKey&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=$page";
    client ??= http.Client();
    var response = await client.get(url);
    if (response.statusCode != 200) {
      return [];
    }
    var data = json.decode(response.body);
    List results = data['results'];
    return results.map((e) => MovieModels.fromJson(e)).toList();
  }

  static Future<MovieDetailModels> getDetails(MovieModels movieModels,
      {int movieID, http.Client client}) async {
    String url =
        "https://api.themoviedb.org/3/movie/${movieID ?? movieModels.id}.?api_key=$apiKey&language=en-US";
    client ??= http.Client();

    var response = await client.get(url);
    var data = json.decode(response.body);

    List genres = (data as Map<String, dynamic>)['genres'];
    String language;

    switch ((data as Map<String, dynamic>)['original_language'].toString()) {
      case 'ja':
        language = 'Japanese';
        break;
      case 'en':
        language = 'English';
        break;
      case 'ko':
        language = 'Korean';
        break;
      case 'id':
        language = 'Indonesian';
        break;
    }
    return (movieID != null)?MovieDetailModels(MovieModels.fromJson(data),
        language: language,
        genres: genres
            .map((e) => ((e as Map<String, dynamic>)['name'].toString()))
            .toList()): MovieDetailModels(movieModels,
        language: language,
        genres: genres
            .map((e) => ((e as Map<String, dynamic>)['name'].toString()))
            .toList());
  }

  static Future<List<CreditModels>> getCredits(int movieId,
      {http.Client client}) async {
    String url =
        "https://api.themoviedb.org/3/movie/$movieId/credits?api_key=$apiKey&language=en-US";

    client ??= http.Client();

    var response = await client.get(url);
    var data = json.decode(response.body);

    return ((data as Map<String, dynamic>)['cast'] as List)
        .map((e) => CreditModels(
            name: (e as Map<String, dynamic>)['name'],
            profilePath: (e as Map<String, dynamic>)['profile_path']))
        .take(8)
        .toList();
  }
}
