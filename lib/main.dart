import 'dart:async';
import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_app/src/app.dart';
import 'package:movie_app/src/network/api_call_helper.dart';
import 'package:movie_app/src/state_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  //for screen support portrait / landscape
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runZonedGuarded(() async {
    //-------- Data helpers ------------
    ApiCallHelper? apiCallHelper = ApiCallHelper.getInstance();

    runApp(StateProvider(apiCallHelper: apiCallHelper, child: const App()));
  }, (error, stack) async {
    // for crash log
    if (kDebugMode) {
      log(error.toString());
    }
  }, zoneSpecification: const ZoneSpecification());
}
