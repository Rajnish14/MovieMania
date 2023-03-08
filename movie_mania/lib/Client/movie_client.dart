import 'package:http/http.dart' as http;
class MovieClient extends http.BaseClient {
  var baseUrl = "https://api.themoviedb.org/3/";

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    final http.Client _httpClient = http.Client();
    Map<String, String> defaultHeaders = {
      'Content-Type': 'application/json; charset=UTF-8',
    };
    request.headers.addAll(defaultHeaders);
    return _httpClient.send(request);
  }
}