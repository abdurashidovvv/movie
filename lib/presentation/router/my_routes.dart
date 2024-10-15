import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie/presentation/ui/movie_detail_screen.dart';
import 'package:movie/presentation/ui/movie_screen.dart';

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
            return const MovieDetailScreen();
          },
        ),
      ],
    ),
  ],
);
