import 'package:bloc_clean_architectural_demo/domain/repositories/demo_repository.dart';
import 'package:bloc_clean_architectural_demo/presentation/cubits/demo/demo_state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class DetailMovieCubit extends Cubit<DetailMovieState> {
  CastRepository castRepository;
  DetailMovieCubit(
    this.castRepository,
  ) : super(DetailMovieInitial());

  Future<void> fetchDetail(int id) async {
    try {
      emit(DetailMoviesLoading());

      final casts = await castRepository.fetchCastMovie(id);

      emit(DetailMoviesLoaded(casts: casts));
    } catch (e) {
      emit(DetailMoviesError('$e'));
    }
  }
}
