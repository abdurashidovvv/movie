import 'package:flutter/material.dart';
import 'package:movie/data/model/tv_show.dart';
import 'package:movie/domain/entity/movie_entity.dart';

class DetailScreen extends StatefulWidget {
  final TvShow? show;
  final MovieEntity? movie;

  const DetailScreen({super.key, required this.show, required this.movie});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(),
    );
  }
}
