import 'package:act3_7/common/util.dart';

class Media {
  int id;
  double voteAverage;
  String title;
  String posterPath;
  String backdropPath;
  String overview;
  String releaseDate;
  int releaseYear;
  String genres;
  String director;

  String getPosterUrl() => getMediumPictureUrl(posterPath);
  String getBackDropUrl() => getLargePictureUrl(posterPath);
  // String getGenres() => getGenreValues(genreIds);
  int getRealeaseYear() {
    if (releaseDate == '') {return 0;} 
    return DateTime.parse(releaseDate).year;
  }

  factory Media(Map jsonMap) {
    try {
      return Media.deserialize(jsonMap);
    } catch (ex) {
      rethrow;
    }
  }

  Media.deserialize(Map json):
    id = json["id"].toInt(),
    voteAverage = json["vote_average"].toDouble(),
    title = json["title"],
    posterPath = json["poster_path"] ?? "",
    backdropPath = json["backdrop_path"] ?? "",
    overview = json["overview"] ?? "",
    releaseDate = json["release_date"],
    releaseYear = DateTime.parse(json["release_date"]).year,
    director = json["director"] ?? "",
    genres = getGenreValues(json["genre_ids"].toList());
}