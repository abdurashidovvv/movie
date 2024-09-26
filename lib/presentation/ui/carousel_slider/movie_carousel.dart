import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:movie/data/model/movie_model.dart';

class MovieCarousel extends StatelessWidget {
  final List<MovieModel> movies;
  const MovieCarousel({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
          height: 300.0, enlargeCenterPage: true, viewportFraction: 0.6),
      items: movies.map((movie) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: 300,
                margin: const EdgeInsets.symmetric(horizontal: 5.0),
                decoration: const BoxDecoration(color: Colors.amber),
                child: Text(
                  'Title: ${movie.title}',
                  style: const TextStyle(fontSize: 16.0),
                ));
          },
        );
      }).toList(),
    );
  }
}
