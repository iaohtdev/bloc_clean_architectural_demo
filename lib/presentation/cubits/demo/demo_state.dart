import 'package:bloc_clean_architectural_demo/data/models/demo_model.dart';
import 'package:equatable/equatable.dart';

sealed class DetailMovieState extends Equatable {
  const DetailMovieState();

  @override
  List<Object> get props => [];
}

final class DetailMovieInitial extends DetailMovieState {}

class DetailMoviesInitial extends DetailMovieState {}

class DetailMoviesLoading extends DetailMovieState {}

class DetailMoviesLoaded extends DetailMovieState {
  final List<DemoModel>? casts;

  const DetailMoviesLoaded({this.casts});

  @override
  List<Object> get props => [];
}

class DetailMoviesError extends DetailMovieState {
  final String message;

  const DetailMoviesError(this.message);

  @override
  List<Object> get props => [message];
}
