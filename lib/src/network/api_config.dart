//This class is used to handle api configs
class ApiConfig {
  ApiConfig._(); // this basically makes it so you can't instantiate this class

  //API Base URL's
  //For Local
  static const String baseUrlDev = 'https://api.themoviedb.org/3/movie/';

  //For Live
  static const String baseUrlLive = 'https://api.themoviedb.org/3/movie/';

  //For Uat
  static const String baseUrlUat = 'https://api.themoviedb.org/3/movie/';

  static const String apiKey = "909594533c98883408adef5d56143539";

  //Apis names
  static const String popularMovieListApi = 'popular';
  static const String latestMovieListApi = 'latest';
}
