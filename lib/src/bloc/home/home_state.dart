part of 'home_bloc.dart';

class HomeState extends Equatable {
  const HomeState({
    this.apiCallState,
    this.latestMovie,
    this.popularMovieRes,
    this.popularMovies,
    this.currentIndex = 0,
  });

  final ApiCallState? apiCallState; //Network calling status
  final LatestMovie? latestMovie;
  final PopularMovie? popularMovieRes;
  final List<Results>? popularMovies;
  final int? currentIndex;

  HomeState copyWith(
      {ApiCallState? apiCallState,
      LatestMovie? latestMovie,
      int? currentPageNumber,
      PopularMovie? popularMovieRes,
      List<Results>? popularMovies,
      int? currentIndex}) {
    return HomeState(
        apiCallState: apiCallState ?? this.apiCallState,
        latestMovie: latestMovie ?? this.latestMovie,
        currentIndex: currentIndex ?? this.currentIndex,
        popularMovieRes: popularMovieRes ?? this.popularMovieRes,
        popularMovies: popularMovies ?? this.popularMovies);
  }

  @override
  List<Object?> get props =>
      [apiCallState, latestMovie, popularMovieRes, popularMovies, currentIndex];
}
