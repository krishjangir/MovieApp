import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/home/home_bloc.dart';
import 'MovieRow.dart';

class LatestMovieItem extends StatelessWidget {
  const LatestMovieItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
        buildWhen: (previous, current) =>
            previous.latestMovie != current.latestMovie,
        builder: (context, state) {
          return state.latestMovie != null
              ? LatestMovieRow(action: () {}, latestMovie: state.latestMovie!)
              : const SizedBox();
        });
  }
}
