import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movie/data/model/movie_model.dart';
import 'package:movie/data/model/tv_show.dart';
import 'package:movie/presentation/bloc/movie/movie_bloc.dart';
import 'package:movie/presentation/bloc/tv_show/tv_show_bloc.dart';
import 'package:movie/presentation/bloc/tv_show/tv_show_event.dart';
import 'package:movie/presentation/ui/movie_detail_screen.dart';
import 'package:movie/presentation/ui/movie_screen.dart';
import 'package:movie/presentation/ui/show_detail_screen.dart';

import 'data/repository/movie_repository.dart';
import 'data/repository/tv_show_repository.dart';

void main() {
  runApp(MyApp());
}

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const MovieScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'details',
          builder: (BuildContext context, GoRouterState state) {
            final tvShow = state.extra as TvShow;
            return DetailScreen(show: tvShow);
          },
        ),
      ],
    ),
  ],
);

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
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          showSemanticsDebugger: false,
          title: "Movies",
          routerConfig: _router,
        ));
  }
}
