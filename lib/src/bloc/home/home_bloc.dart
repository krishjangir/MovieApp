import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/remote/model/latest_movie.dart';
import '../../data/remote/model/popular_movie.dart';
import '../../data/remote/repo/MovieRepository.dart';
import '../../network/api_response.dart';
import 'home_fragment_state.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final MovieRepository? movieRepository;

  HomeBloc({required this.movieRepository}) : super(const HomeState()) {
    on<CurrentIndexChanged>(_currentIndexChanged);
    on<GetLatestMovie>(_getLatestMovie);
    on<GetPopularMovie>(_getPopularMovie);
  }

  void _currentIndexChanged(
    CurrentIndexChanged event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(currentIndex: event.currentIndex));
  }

  //Get LatestMovie:-------------------------------
  void _getLatestMovie(
    GetLatestMovie event,
    Emitter<HomeState> emit,
  ) async {
    try {
      emit(state.copyWith(apiCallState: ApiCallState.loading));
      var apiResponse = await movieRepository?.getLatestMovieList();
      var response = LatestMovie.fromJson(apiResponse?.data);
      emit(state.copyWith(
          latestMovie: response, apiCallState: ApiCallState.success));
    } catch (_) {
      emit(state.copyWith(apiCallState: ApiCallState.error));
    }
  }

  //Get PopularMovie:-------------------------------
  void _getPopularMovie(
    GetPopularMovie event,
    Emitter<HomeState> emit,
  ) async {
    try {
      emit(state.copyWith(apiCallState: ApiCallState.loading));
      var apiResponse = await movieRepository?.getPopularMovieList();
      var response = PopularMovie.fromJson(apiResponse?.data);
      emit(state.copyWith(
          popularMovieRes: response,
          popularMovies: response.results,
          apiCallState: ApiCallState.success));
    } catch (_) {
      emit(state.copyWith(apiCallState: ApiCallState.error));
    }
  }
}
