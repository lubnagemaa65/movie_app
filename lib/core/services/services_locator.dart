import 'package:get_it/get_it.dart';
import 'package:movie_app/movies/data/datasource/remote_datasource.dart';
import 'package:movie_app/movies/data/repository/movies_repository.dart';
import 'package:movie_app/movies/domain/repository/base_movie_repository.dart';
import 'package:movie_app/movies/domain/usecases/get_now_playing_movies.dart';
import 'package:movie_app/movies/domain/usecases/get_popular_movies.dart';
import 'package:movie_app/movies/domain/usecases/get_recommendation.dart';
import 'package:movie_app/movies/domain/usecases/get_top_rated_movies.dart';
import 'package:movie_app/movies/presentation/controller/movie_details_bloc.dart';
import 'package:movie_app/movies/presentation/controller/movies_bloc.dart';

class ServicesLocator {
  void init() {
    //Bloc
    //we use registerFactory to create a new object once we call MovieBloc
    sl.registerFactory(() => MoviesBloc(
          sl(),
          sl(),
          sl(),
        ));
    sl.registerFactory(() => MovieDetailsBloc(sl(), sl(), sl()));

    //USECASES
    sl.registerLazySingleton(
        () => GetNowPlayingUseCase(baseMovieRepository: sl()));
    sl.registerLazySingleton(
        () => GetPopularUseCase(baseMovieRepository: sl()));
    sl.registerLazySingleton(
        () => GetTopRatedUseCase(sl(), baseMovieRepository: sl()));
    sl.registerLazySingleton(() => GetRecommendationUseCase(sl()));
    sl.registerLazySingleton(() => GetRecommendationUseCase(sl()));

//REPOSITORY
//we inject an object from datasource by using sl.
    sl.registerLazySingleton<BaseMovieRepository>(
        () => MoviesRepository(baseMovieRepository: sl()));

    //WE NEED TO USE SINGLETONE PATTERN TO REDUCE THE SIZE OF MEMORY EACH TIME WE CREAT A NEW INSTANCE

    ///DATASOURCE
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(
        () => MovieRemoteDataSource());
  }
}

final sl = GetIt.instance;
