import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/src/res/strings.dart';

import '../bloc/home/home_bloc.dart';
import '../bloc/home/home_fragment_state.dart';
import '../res/colors.dart';
import '../res/dimens/dimens.dart';
import '../res/font_config/font_sizes.dart';
import '../res/font_config/font_weights.dart';
import 'LatestMovie.dart';
import 'PopularMovie.dart';

class HomeScreen extends StatelessWidget {
  static const String id = '/HomeScreen';

  HomeScreen({Key? key}) : super(key: key);

  final List<Widget> _pages = [const LatestMovieItem(), const PopularMovies()];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
        buildWhen: (previous, current) =>
            previous.currentIndex != current.currentIndex,
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0.0,
              centerTitle: true,
              leading: IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {},
              ),
              title: Text(
                AppStrings.appName,
                style: TextStyle(
                  fontSize: FontSizes.titleFontSize,
                  color: AppColors.colorBlack,
                  fontWeight: FontWeights.semiBold,
                ),
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.video_camera, size: Dimen.dp_25),
                    label: "Latest"),
                BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.app_badge, size: Dimen.dp_25),
                    label: "Popular"),
              ],
              currentIndex: state.currentIndex ?? 0,
              type: BottomNavigationBarType.fixed,
              onTap: (int index) {
                context.read<HomeBloc>().add(CurrentIndexChanged(index));
                if (index == 0) {
                  context.read<HomeBloc>().add(const GetLatestMovie());
                } else {
                  context.read<HomeBloc>().add(const GetPopularMovie());
                }
              },
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: Dimen.dp_10),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    BlocBuilder<HomeBloc, HomeState>(
                        buildWhen: (previous, current) =>
                            previous.currentIndex != current.currentIndex,
                        builder: (context, state) {
                          return _pages[state.currentIndex ?? 0];
                        })
                  ],
                ),
              ),
            ),
          );
        });
  }
}
