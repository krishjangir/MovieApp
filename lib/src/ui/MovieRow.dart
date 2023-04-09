import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/src/res/colors.dart';
import 'package:movie_app/src/res/font_config/font_weights.dart';

import '../data/remote/model/latest_movie.dart';
import '../data/remote/model/popular_movie.dart';
import '../res/dimens/dimens.dart';
import '../res/font_config/font_sizes.dart';

//PopularMovieRow :------------------------------------------------------------
class PopularMovieRow extends StatelessWidget {
  const PopularMovieRow(
      {Key? key, required this.action, required this.popularMovie})
      : super(key: key);

  final VoidCallback action;
  final Results popularMovie;

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.white,
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimen.dp_15),
        ),
        child: InkWell(
          onTap: action,
          child: Column(
            children: [
              CachedNetworkImage(
                imageUrl: popularMovie.posterPath ?? '',
                fit: BoxFit.contain,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    SizedBox(
                        height: Dimen.dp_50,
                        width: Dimen.dp_50,
                        child: Padding(
                          padding: EdgeInsets.all(Paddings.padding_5),
                          child: CircularProgressIndicator(
                              value: downloadProgress.progress),
                        )),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
              Padding(
                padding: EdgeInsets.all(Paddings.padding_16),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            popularMovie.title ?? "",
                            style: TextStyle(
                              fontSize: FontSizes.titleFontSize,
                              color: AppColors.colorBlack,
                              fontWeight: FontWeights.semiBold,
                            ),
                          ),
                          Text(
                            popularMovie.overview ?? "",
                            style: TextStyle(
                              fontSize: FontSizes.subTitleFontSize,
                              color: AppColors.colorGray,
                              fontWeight: FontWeights.regular,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

//LatestMovieRow :------------------------------------------------------------
class LatestMovieRow extends StatelessWidget {
  const LatestMovieRow(
      {Key? key, required this.action, required this.latestMovie})
      : super(key: key);

  final VoidCallback action;
  final LatestMovie latestMovie;

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.white,
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimen.dp_15),
        ),
        child: InkWell(
          onTap: action,
          child: Column(
            children: [
              CachedNetworkImage(
                imageUrl: latestMovie.posterPath ?? '',
                fit: BoxFit.contain,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    SizedBox(
                        height: Dimen.dp_50,
                        width: Dimen.dp_50,
                        child: Padding(
                          padding: EdgeInsets.all(Paddings.padding_5),
                          child: CircularProgressIndicator(
                              value: downloadProgress.progress),
                        )),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
              Padding(
                padding: EdgeInsets.all(Paddings.padding_16),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            latestMovie.title ?? "",
                            style: TextStyle(
                              fontSize: FontSizes.titleFontSize,
                              color: AppColors.colorBlack,
                              fontWeight: FontWeights.semiBold,
                            ),
                          ),
                          Text(
                            latestMovie.overview ?? "",
                            style: TextStyle(
                              fontSize: FontSizes.subTitleFontSize,
                              color: AppColors.colorGray,
                              fontWeight: FontWeights.regular,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
