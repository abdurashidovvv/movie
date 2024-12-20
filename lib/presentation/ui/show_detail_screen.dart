import 'package:flutter/material.dart';
import 'package:movie/data/model/tv_show.dart';
import 'package:movie/domain/entity/movie_entity.dart';

class DetailScreen extends StatefulWidget {
  final TvShow? show;

  const DetailScreen({super.key, required this.show});

  @override
  State<DetailScreen> createState() => _DetailScreenState();

}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: GestureDetector(
          child: const Icon(Icons.arrow_back, color: Colors.white),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        title: Text(widget.show!.name ?? "",
            style: const TextStyle(
                fontSize: 22,
                color: Colors.white,
                fontWeight: FontWeight.w700)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  'https://image.tmdb.org/t/p/w500${widget.show!.posterPath}',
                  width: 200,
                  height: 200,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Name of show: ${widget.show!.name}",
                          softWrap: true,
                          overflow: TextOverflow.visible,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w400)),
                      const SizedBox(height: 10),
                      Text("Vote average: ${widget.show!.vote_average}",
                          softWrap: true,
                          overflow: TextOverflow.visible,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w400)),
                      const SizedBox(height: 10),
                      Text("Vote count:${widget.show!.vote_count}",
                          softWrap: true,
                          overflow: TextOverflow.visible,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w400)),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Description",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w800)),
                  const SizedBox(height: 10),
                  Text(
                    widget.show!.over_view ?? "",
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
