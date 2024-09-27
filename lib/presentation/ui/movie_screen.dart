// lib/presentation/ui/movie_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/data/model/movie_model.dart';
import 'package:movie/presentation/ui/carousel_slider/movie_carousel.dart';
import 'package:movie/presentation/ui/drawer/drawer_header.dart';
import 'package:movie/presentation/ui/drawer/drawer_menu.dart';
import 'package:movie/presentation/ui/tv_shows/tv_shows.dart';
import '../bloc/movie/movie_bloc.dart';
import '../bloc/tv_show/tv_show_bloc.dart';
import '../bloc/tv_show/tv_show_state.dart';

class MovieScreen extends StatefulWidget {
  const MovieScreen({super.key});

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  final GlobalKey<SliderDrawerState> _key = GlobalKey<SliderDrawerState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SliderDrawer(
        key: _key,
        appBar: const SliderAppBar(
          appBarColor: Colors.black,
          title: Text(
            "Movies & TV Shows",
            style: TextStyle(
                fontSize: 22,
                color: Colors.white,
                fontWeight: FontWeight.w700),
          ),
        ),
        slider: Container(
          color: Colors.black87,
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 15),
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
        child: Container(
          color: Colors.black, // Asosiy kontentning fon rangi
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Trends",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 10),
                  BlocBuilder<MovieBloc, MovieState>(
                    builder: (context, state) {
                      if (state is MovieLoading) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is MovieLoaded) {
                        return MovieCarousel(movies: state.movies);
                      } else if (state is MovieError) {
                        return Center(child: Text(state.message, style: TextStyle(color: Colors.red)));
                      } else {
                        return const SizedBox.shrink();
                      }
                    },
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Popular TV Shows",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 10),
                  BlocBuilder<TvShowBloc, TvShowState>(
                    builder: (context, state) {
                      if (state is TvShowLoading) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is TvShowLoaded) {
                        return TvShows(shows: state.tvShows);
                      } else if (state is TvShowError) {
                        return Center(child: Text(state.message, style: TextStyle(color: Colors.red)));
                      } else {
                        return const SizedBox.shrink();
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
