import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:movie/data/model/movie_model.dart';
import 'package:movie/presentation/ui/carousel_slider/movie_carousel.dart';
import 'package:movie/presentation/ui/drawer/drawer_header.dart';
import 'package:movie/presentation/ui/drawer/drawer_menu.dart';
import '../bloc/movie_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieScreen extends StatefulWidget {
  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  GlobalKey<SliderDrawerState> _key = GlobalKey<SliderDrawerState>();

  List<MovieModel> movies = [
    MovieModel(title: "title", overView: "overView", posterPath: "posterPath"),
    MovieModel(title: "title", overView: "overView", posterPath: "posterPath"),
    MovieModel(title: "title", overView: "overView", posterPath: "posterPath"),
    MovieModel(title: "title", overView: "overView", posterPath: "posterPath"),
  ];

  @override
  void initState() {
    super.initState();
    BlocProvider.of<MovieBloc>(context).add(FetchTrendingMovies());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<MovieBloc, MovieState>(
      builder: (context, state) {
        if (state is MovieLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is MovieLoaded) {
          return SliderDrawer(
              key: _key,
              appBar: const SliderAppBar(
                appBarColor: Colors.grey,
                title: Text(
                  "Movies",
                  style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.w700),
                ),
              ),
              slider: Container(
                color: Colors.black87,
                padding:
                    const EdgeInsets.symmetric(vertical: 50, horizontal: 15),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    MovieDrawerHeader(),
                    SizedBox(
                      height: 50,
                    ),
                    Column(
                      children: [
                        DrawerMenu(title: "Home", icon: Icons.home),
                        SizedBox(height: 20),
                        DrawerMenu(title: "Movies", icon: Icons.movie),
                        SizedBox(height: 20),
                        DrawerMenu(title: "TV Series", icon: Icons.tv),
                        SizedBox(height: 20),
                        DrawerMenu(title: "Settings", icon: Icons.settings),
                        SizedBox(height: 20),
                        DrawerMenu(title: "Info", icon: Icons.info),
                      ],
                    )
                  ],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MovieCarousel(movies: state.movies),
                ],
              ));
        } else {
          return const Center(child: Text("It has an error"));
        }
      },
    ));
  }
}
