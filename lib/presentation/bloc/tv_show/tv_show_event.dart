import 'package:equatable/equatable.dart';

abstract class TvShowEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchPopularTvShows extends TvShowEvent {}