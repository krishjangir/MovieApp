part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class CurrentIndexChanged extends HomeEvent {
  const CurrentIndexChanged(this.currentIndex);

  final int currentIndex;

  @override
  List<Object> get props => [currentIndex];
}

class HomeInit extends HomeEvent {
  const HomeInit();
}

class GetLatestMovie extends HomeEvent {
  const GetLatestMovie();
}

class GetPopularMovie extends HomeEvent {
  const GetPopularMovie();
}
