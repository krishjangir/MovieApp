import '../../../network/api_call_helper.dart';
import '../../../network/api_config.dart';
import '../../../network/api_response.dart';

class MovieRepository {
  static MovieRepository? _instance;
  final ApiCallHelper? apiCallHelper;

  MovieRepository._internal({this.apiCallHelper});

  factory MovieRepository({required ApiCallHelper? apiCallHelper}) =>
      _instance ??= MovieRepository._internal(apiCallHelper: apiCallHelper);

  //Get Latest Movie api call:----------------------------------
  Future<ApiResponse?> getLatestMovieList() async {
    final response = await apiCallHelper?.getApiCallWithQuery(
        ApiConfig.latestMovieListApi, {"api_key": ApiConfig.apiKey});
    return response;
  }

  //Get Popular Movie api call:----------------------------------
  Future<ApiResponse?> getPopularMovieList() async {
    final response = await apiCallHelper?.getApiCallWithQuery(
        ApiConfig.popularMovieListApi, {"api_key": ApiConfig.apiKey});
    return response;
  }
}
