enum HomeFragmentState {
  latestMovie,
  popularMovies,
}

extension HomeUIState on HomeFragmentState {
  static final Map<HomeFragmentState, int> _map = {
    HomeFragmentState.latestMovie: 0,
    HomeFragmentState.popularMovies: 1,
  };

  int? get value => _map[this];
}
