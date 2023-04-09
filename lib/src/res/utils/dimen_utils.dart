import 'package:flutter/material.dart';

import '../../app.dart';

class DimenUtils {
  late MediaQueryData _mediaQueryData;

  DimenUtils(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
  }

  /// getShortestSide fun is used to calculate shortestSide with pixelRatio
  /// */
  double getShortestSide() {
    final safeArea = (_mediaQueryData.orientation == Orientation.portrait
        ? _mediaQueryData.padding.left + _mediaQueryData.padding.right
        : _mediaQueryData.padding.top + _mediaQueryData.padding.bottom);
    final shortestSide = _mediaQueryData.size.shortestSide;
    final pixelRatio = _mediaQueryData.devicePixelRatio;
    double sideBlock = (shortestSide - safeArea) / 100;
    final isDesktop = shortestSide >= 950;
    final isTablet = shortestSide >= 600;

    if (isDesktop) {
      sideBlock = sideBlock * 0.40;
    } else if (isTablet) {
      sideBlock = sideBlock * 0.45;
    }

    return sideBlock / pixelRatio;
  }

  /// getSafeHeight fun is used to calculate safe height with pixelRatio
  /// */
  double getSafeHeight() {
    final pixelRatio = _mediaQueryData.devicePixelRatio;
    final screenHeight = _mediaQueryData.size.height;
    final safeAreaVertical =
        _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;
    final safeBlockVertical = (screenHeight - safeAreaVertical) / 100;

    return safeBlockVertical / pixelRatio;
  }

  /// getSafeWidth fun is used to calculate safe Width with pixelRatio
  /// */
  double getSafeWidth() {
    final screenWidth = _mediaQueryData.size.width;
    final pixelRatio = _mediaQueryData.devicePixelRatio;
    final safeAreaHorizontal =
        _mediaQueryData.padding.left + _mediaQueryData.padding.right;
    final safeBlockHorizontal = (screenWidth - safeAreaHorizontal) / 100;

    return safeBlockHorizontal / pixelRatio;
  }
}

/// DimenSize extension is used to dimensions
/// hdp - dp according to safe height
/// wdp - dp according to safe width
/// dp -  dp according to safe shortestSide
/// */
extension DimenSize on num {
  double get hdp =>
      DimenUtils(App.navigatorKey.currentContext!).getSafeHeight() * this;

  double get wdp =>
      DimenUtils(App.navigatorKey.currentContext!).getSafeWidth() * this;

  double get dp =>
      DimenUtils(App.navigatorKey.currentContext!).getShortestSide() * this;
}

/// FontSize extension is used to font sizes
/// sp -  sp according to safe shortestSide
/// */
extension FontSize on num {
  double get sp =>
      DimenUtils(App.navigatorKey.currentContext!).getShortestSide() * this;
}
