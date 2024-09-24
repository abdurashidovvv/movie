import 'package:movie/domain/entity/movie_entity.dart';

class MovieModel extends MovieEntity {
  MovieModel({
    required String title,
    required String overView,
    required String posterPath,
  }) : super(title: title, overView: overView, posterPath: posterPath);

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
        title: json['title'] ?? '',
        overView: json['overview'] ?? '',
        posterPath: json['poster_path'] ?? '');
  }
}
