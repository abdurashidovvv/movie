import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/presentation/bloc/movie/movie_bloc.dart';
import 'package:movie/presentation/bloc/tv_show/tv_show_bloc.dart';
import 'package:movie/presentation/bloc/tv_show/tv_show_event.dart';
import 'package:movie/presentation/ui/movie_screen.dart';

import 'data/repository/movie_repository.dart';
import 'data/repository/tv_show_repository.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final TvShowRepository tvShowRepository = TvShowRepository();
  final MovieRepository movieRepository = MovieRepository();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<TvShowBloc>(
              create: (context) =>
                  TvShowBloc(tvShowRepository)..add(FetchPopularTvShows())),
          BlocProvider<MovieBloc>(
              create: (context) =>
                  MovieBloc(movieRepository)..add(FetchTrendingMovies()))
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          showSemanticsDebugger: false,
          title: "Movies",
          home: MovieScreen(),
        ));
  }
}
