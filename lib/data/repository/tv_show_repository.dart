import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/tv_show.dart';

class TvShowRepository {
  final String apiKey = '445fbe6be040b3b1217543d16db4c756';
  final String baseUrl = 'https://api.themoviedb.org/3';

  Future<List<TvShow>> fetchPopularTvShows() async {
    final response = await http.get(Uri.parse('$baseUrl/tv/popular?api_key=$apiKey'));

    if (response.statusCode == 200) {
      final List<dynamic> results = jsonDecode(response.body)['results'];
      return results.map((tvShow) => TvShow.fromJson(tvShow)).toList();
    } else {
      throw Exception('Failed to load TV shows');
    }
  }
}
