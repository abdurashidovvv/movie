import 'package:flutter/material.dart';
import '../../../data/model/tv_show.dart';

class TvShows extends StatelessWidget {
  final List<TvShow> shows;

  const TvShows({Key? key, required this.shows}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: shows.length,
        itemBuilder: (context, index) {
          final show = shows[index];
          return Card(
            color: Colors.grey[900],
            margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 10), // Kichik margin
            child: Padding(
              padding: const EdgeInsets.all(4.0), // Kichik padding
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      'https://image.tmdb.org/t/p/w500${show.posterPath}',
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                      loadingBuilder: (BuildContext context, Widget child,
                          ImageChunkEvent? loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        } else {
                          return Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                  (loadingProgress.expectedTotalBytes ?? 1)
                                  : null,
                            ),
                          );
                        }
                      },
                      errorBuilder: (BuildContext context, Object exception,
                          StackTrace? stackTrace) {
                        return const Icon(Icons.error, color: Colors.red);
                      },
                    ),
                  ),
                  const SizedBox(width: 8), // Kichik bo'shliq
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          show.name,
                          style: const TextStyle(
                              fontSize: 16.0,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                          overflow: TextOverflow.visible,
                        ),
                        Text(
                          'Rating: ${show.rating}',
                          style: const TextStyle(
                              fontSize: 14.0,
                              color: Colors.white70,
                              fontWeight: FontWeight.w500),
                          overflow: TextOverflow.visible,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
