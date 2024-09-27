import 'package:flutter/material.dart';
import 'package:movie/data/model/tv_show.dart';

class TvShows extends StatefulWidget {
  final List<TvShow> shows;

  const TvShows({super.key, required this.shows});

  @override
  State<TvShows> createState() => _TvShowsState();
}

class _TvShowsState extends State<TvShows> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.shows.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
            widget.shows[index].name,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
          ),
        );
      },
    );
  }
}
