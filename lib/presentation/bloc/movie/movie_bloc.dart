import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../data/repository/movie_repository.dart';
import '../../../domain/entity/movie_entity.dart';

// States
abstract class MovieState extends Equatable {
  @override
  List<Object> get props => [];
}

class MovieInitial extends MovieState {}

class MovieLoading extends MovieState {}

class MovieLoaded extends MovieState {
  final List<MovieEntity> movies;

  MovieLoaded(this.movies);

  @override
  List<Object> get props => [movies];
}

class MovieError extends MovieState {
  final String message;

  MovieError(this.message);

  @override
  List<Object> get props => [message];
}

// Events
abstract class MovieEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchTrendingMovies extends MovieEvent {}

// Bloc
class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final MovieRepository movieRepository;

  MovieBloc(this.movieRepository) : super(MovieInitial()) {
    // Register event handler using `on` method
    on<FetchTrendingMovies>((event, emit) async {
      emit(MovieLoading());
      try {
        final movies = await movieRepository.getTrendingMovies();
        emit(MovieLoaded(movies));
      } catch (e) {
        emit(MovieError('Failed to fetch movies'));
      }
    });
  }
}
