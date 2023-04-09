import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/home/home_bloc.dart';
import 'data/remote/repo/MovieRepository.dart';
import 'network/api_call_helper.dart';

class StateProvider extends StatelessWidget {
  final Widget child;
  final ApiCallHelper? apiCallHelper;

  const StateProvider(
      {Key? key, required this.child, required this.apiCallHelper})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    //-------- Repositories ------------
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider(
              create: (_) => MovieRepository(apiCallHelper: apiCallHelper)),
        ],
        //-------- BLoCs ------------
        child: MultiBlocProvider(providers: [
          BlocProvider<HomeBloc>(
              create: (_) => HomeBloc(
                  movieRepository: RepositoryProvider.of<MovieRepository>(_))
                ..add(const GetLatestMovie())),
        ], child: child));
  }
}
