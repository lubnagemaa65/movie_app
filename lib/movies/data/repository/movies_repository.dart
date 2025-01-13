import 'package:dartz/dartz.dart';
import 'package:movie_app/error/exception.dart';
import 'package:movie_app/error/failure.dart';
import 'package:movie_app/movies/domain/entities/movie.dart';
import 'package:movie_app/movies/domain/entities/movie_details.dart';
import 'package:movie_app/movies/domain/entities/recommendation.dart';
import 'package:movie_app/movies/domain/repository/base_movie_repository.dart';
import 'package:movie_app/movies/domain/usecases/get_movie_details.dart';
import 'package:movie_app/movies/domain/usecases/get_recommendation.dart';

class MoviesRepository extends BaseMovieRepository {
  final BaseMovieRepository baseMovieRepository;
  MoviesRepository({
    required this.baseMovieRepository,
  });

  @override
  //we have 2 return types at the same method so we'd use dartz package then either command .
  // in this case Either <L,R> THE LEFT PART for failure (exception) and the right one is for successful case(list<movie>)
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies() async {
    final result = await baseMovieRepository.getNowPlayingMovies();
    try {
      return Right(result as List<Movie>);
    } on ServerException catch (failure) {
      return Left(ServerFailure(message: failure.errorMsgModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies() async {
    final result = await baseMovieRepository.getPopularMovies();
    try {
      return Right(result as List<Movie>);
    } on ServerException catch (failure) {
      return Left(ServerFailure(message: failure.errorMsgModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovies() async {
    final result = await baseMovieRepository.getTopRatedMovies();
    try {
      return Right(result as List<Movie>);
    } on ServerException catch (failure) {
      return Left(ServerFailure(message: failure.errorMsgModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, MovieDetail>> getMovieDetails(
      MoviesDetailsParameters parameters) async {
    final result = await baseMovieRepository.getMovieDetails(parameters);
    try {
      return Right(result as MovieDetail);
    } on ServerException catch (failure) {
      return Left(ServerFailure(message: failure.errorMsgModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Recommendation>>> getRecommendation(
      RecommendationParameter parameters) async {
    final result = await baseMovieRepository.getRecommendation(parameters);
    try {
      return Right(result as List<Recommendation>);
    } on ServerException catch (failure) {
      return Left(ServerFailure(message: failure.errorMsgModel.statusMessage));
    }
  }
}
