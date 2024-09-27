import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/presentation/bloc/tv_show/tv_show_event.dart';
import 'package:movie/presentation/bloc/tv_show/tv_show_state.dart';

import '../../../data/repository/tv_show_repository.dart';

class TvShowBloc extends Bloc<TvShowEvent, TvShowState> {
  final TvShowRepository tvShowRepository;

  TvShowBloc(this.tvShowRepository) : super(TvShowInitial()) {
    on<FetchPopularTvShows>((event, emit) async {
      emit(TvShowLoading());
      try {
        final tvShows = await tvShowRepository.fetchPopularTvShows();
        emit(TvShowLoaded(tvShows: tvShows));
      } catch (e) {
        emit(TvShowError(message: e.toString()));
      }
    });
  }
}
