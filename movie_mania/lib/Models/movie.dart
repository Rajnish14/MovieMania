import 'dart:convert';

class Movie {
  String? backdrop_path;
  int? id;
  String? title;
  String? overview;
  String? original_language;
  String? poster_path;
  DateTime? release_date;
  String? vote_average;
  int? vote_count;
  List<int>? genre_ids;

  Movie({
    this.backdrop_path,
    this.genre_ids,
    this.id,
    this.original_language,
    this.overview,
    this.poster_path,
    this.release_date,
    this.title,
    this.vote_average,
    this.vote_count,
  });

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
        id: json["id"],
        backdrop_path: json["backdrop_path"],
        release_date: DateTime.parse(json["release_date"]),
        vote_count: json["vote_count"],
        title: json["title"],
        vote_average: json["vote_average"].toString(),
        poster_path: json["poster_path"],
        original_language: json["original_language"],
        overview: json["overview"],
        genre_ids: json["genre_ids"] != null && json["genre_ids"].isNotEmpty ? List<int>.from(json["genre_ids"].map((x) => (x))) : [],
      );
}
