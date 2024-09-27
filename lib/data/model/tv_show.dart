class TvShow {
  final String name;
  final String posterPath;
  final double rating;

  TvShow({required this.name, required this.posterPath, required this.rating});

  // Factory method to create a TvShow object from JSON
  factory TvShow.fromJson(Map<String, dynamic> json) {
    return TvShow(
      name: json['name'],
      posterPath: json['poster_path'],
      rating: json['vote_average'].toDouble(),
    );
  }
}