import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/tv_show.dart';

class TvShowRepository {
  final String apiKey = 'YOUR_API_KEY';
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
