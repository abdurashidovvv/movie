import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:movie/domain/entity/movie_entity.dart';

class MovieCarousel extends StatelessWidget {
  final List<MovieEntity> movies;
  final Function(MovieEntity movie) onTap;

  const MovieCarousel({super.key, required this.movies, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
          height: 300.0, enlargeCenterPage: true, viewportFraction: 0.6),
      items: movies.map((movie) {
        return GestureDetector(
          onTap: onTap(movie),
          child: Builder(
            builder: (BuildContext context) {
              return Container(
                  width: 300,
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(color: Colors.blueGrey, borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.grey[300],
                              border: Border.all(
                                color: Colors.blueAccent,
                                width: 4.0,
                              ),
                              borderRadius: BorderRadius.circular(15)),
                          child: Image.network(
                            height: 150,
                            width: 150,
                            fit: BoxFit.cover,
                            "https://image.tmdb.org/t/p/w500${movie.posterPath}",
                            loadingBuilder: (BuildContext context, Widget child,
                                ImageChunkEvent? loadingProgress) {
                              if (loadingProgress == null) {
                                return child;
                              } else {
                                return Center(
                                  child: CircularProgressIndicator(
                                    value: loadingProgress.expectedTotalBytes !=
                                            null
                                        ? loadingProgress.cumulativeBytesLoaded /
                                            (loadingProgress.expectedTotalBytes ??
                                                1)
                                        : null,
                                  ),
                                );
                              }
                            },
                            errorBuilder: (BuildContext context, Object exception,
                                StackTrace? stackTrace) {
                              return const Text('Rasm yuklanmadi!');
                            },
                          ),
                        ),
                        Text(
                          movie.title,
                          style: const TextStyle(
                              fontSize: 16.0,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          movie.overView.substring(0, 30),
                          style: const TextStyle(
                              fontSize: 14.0,
                              color: Colors.white70,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ));
            },
          ),
        );
      }).toList(),
    );
  }
}
