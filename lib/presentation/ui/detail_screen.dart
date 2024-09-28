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
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: GestureDetector(child: Icon(Icons.arrow_back, color: Colors.white), onTap: () {
          Navigator.pop(context);
        },),
        title: Text(widget.show?.name??"",
            style: const TextStyle(
                fontSize: 22,
                color: Colors.white,
                fontWeight: FontWeight.w700)),
      ),
      body: Column(
        children: [
          Image.network( 'https://image.tmdb.org/t/p/w500${widget.show!.posterPath}', width: 200,height: 200,),
          Text(widget.show?.over_view??"", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400),)
        ],
      ),
    );
  }
}
