import 'package:movie_mania/Client/movie_client.dart';

class MovieService {
  static Future getMovies(page) {
    var apiKey = "4335ced2da680965d916856a64c1497a";
    var response = MovieClient().get(
      Uri.parse(
          "${MovieClient().baseUrl}movie/popular?api_key=$apiKey&page=$page"),
    );
    return response;
  }

  static Future searchMovies(page, query) {
    var apiKey = "4335ced2da680965d916856a64c1497a";
    var response = MovieClient().get(
      Uri.parse(
          "${MovieClient().baseUrl}search/movie?api_key=$apiKey&page=$page&query=$query"),
    );
    return response;
  }
}