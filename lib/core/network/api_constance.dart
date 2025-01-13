class ApiConstance {
  static const String baseUrl = "https://api.themoviedb.org/3";
  static const String nowPlayingMoviePath =
      "$baseUrl/movie/now_playing?api_key=$apiKey";
  static const String popularMoviesPath =
      "$baseUrl/movie/popular?api_key=$apiKey";
  static const String topRatedMoviesPath =
      "$baseUrl/movie/top_rated?api_key=$apiKey";
  static String movieDetailsPath(int movieId) =>
      "$baseUrl/movie/$movieId?api_key=$apiKey";
  static String recommendationPath(int movieId) =>
      "$baseUrl/movie/$movieId/recommendations?api_key=$apiKey";

  static const String apiKey = "1b8d38ea7dbf2c42592199246b3ba8b0";
  static String baseImageUrl(int movieId) => "$baseUrl/movie/$movieId/images";

  static String imageUrl(String path) => "$baseImageUrl/$path";
}
