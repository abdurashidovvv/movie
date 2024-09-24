import 'package:flutter/material.dart';
import '../bloc/movie_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trending Movies'),
      ),
      body: BlocBuilder<MovieBloc, MovieState>(
        builder: (context, state) {
          if (state is MovieLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is MovieLoaded) {
            return ListView.builder(
              itemCount: state.movies.length,
              itemBuilder: (context, index) {
                final movie = state.movies[index];
                return ListTile(
                  leading: Image.network(
                    'https://image.tmdb.org/t/p/w200${movie.posterPath}',
                    fit: BoxFit.cover,
                  ),
                  title: Text(movie.title),
                  subtitle: Text(movie.overView),
                );
              },
            );
          } else if (state is MovieError) {
            return Center(child: Text(state.message));
          } else {
            return Center(child: Text('Press the button to load movies'));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          BlocProvider.of<MovieBloc>(context).add(FetchTrendingMovies());
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}
