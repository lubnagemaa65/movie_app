class ApiConstance{
  static const String baseUrl="https://api.themoviedb.org/3/";
    static const String nowPlayingMoviePath = "${baseUrl}/movie/now_playing?api_key=${apiKey}";
        static const String popularMoviesPath =
      "${baseUrl}/movie/popular?api_key=${apiKey}";
          static const String topRatedMoviesPath =
      "${baseUrl}/movie/top_rated?api_key=${apiKey}";


      static const String apiKey = "1b8d38ea7dbf2c42592199246b3ba8b0";


}