import 'package:http/http.dart' as http;

import '../model/comics.dart';

class ComicRepository {
  final String _baseUrl = "gateway.marvel.com";

  Future<Comics> getComics(Map<String, dynamic> queryParameters) async {
    Uri uri = Uri.https(
      _baseUrl,
      '/v1/public/characters/1009610/comics',
      queryParameters,
    );
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      return comicsFromJson(response.body);
    } else {
      throw Exception("Failed to get comics");
    }
  }
}
