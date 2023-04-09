import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/home/home_bloc.dart';
import '../res/dimens/dimens.dart';
import 'MovieRow.dart';

class PopularMovies extends StatelessWidget {
  const PopularMovies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
        buildWhen: (previous, current) =>
            previous.popularMovies != current.popularMovies,
        builder: (context, state) {
          return state.popularMovies != null
              ? ListView.separated(
                  itemCount: state.popularMovies!.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return PopularMovieRow(
                        action: () {},
                        popularMovie: state.popularMovies![index]);
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      SizedBox(height: Dimen.dp_10),
                )
              : const SizedBox();
        });
  }
}
