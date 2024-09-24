import 'dart:convert';

import '../model/movie_model.dart';
import 'package:http/http.dart' as http;

class MovieRepository {
  final String apiKey = "445fbe6be040b3b1217543d16db4c756";
  final String baseUrl = 'https://api.themoviedb.org/3';

  Future<List<MovieModel>> getTrendingMovies() async {
    final response = await http.get(
      Uri.parse('$baseUrl/trending/movie/day?api_key=$apiKey'),
    );

    if (response.statusCode == 200) {
      final List movies = json.decode(response.body)['results'];
      return movies.map((movie) => MovieModel.fromJson(movie)).toList();
    } else {
      throw Exception('Failed to load trending movies');
    }
  }
}