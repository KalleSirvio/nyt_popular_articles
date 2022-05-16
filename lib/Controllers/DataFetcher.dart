import 'package:http/http.dart' as http;

class DataFetcher {
  DataFetcher();

  Future<http.Response> fetchArticles(String category) {
    return http.get(Uri.parse(
        'https://api.nytimes.com/svc/topstories/v2/$category.json?api-key=GF4d6gnIsmRdLG27bzkNCGpC9etjMecN'));
  }
}
