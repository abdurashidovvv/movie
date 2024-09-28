class TvShow {
  final int id;
  final String name;
  final String over_view;
  final String posterPath;
  final String first_air_date;
  final double vote_average;
  final int vote_count;

  TvShow(
      {required this.id,
      required this.name,
      required this.over_view,
      required this.posterPath,
      required this.first_air_date,
      required this.vote_average,
      required this.vote_count});

  // Factory method to create a TvShow object from JSON
  factory TvShow.fromJson(Map<String, dynamic> json) {
    return TvShow(
      id: json['id'] as int,
      name: json['name'] as String,
      over_view: json['overview'] ?? "",
      posterPath: json['poster_path'] as String,
      first_air_date: json['first_air_date'] as String,
      vote_average: (json['vote_average'] as num).toDouble(),
      vote_count: json['vote_count'] as int,
    );
  }
}
