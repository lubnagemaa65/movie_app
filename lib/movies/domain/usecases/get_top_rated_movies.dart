import 'package:dartz/dartz.dart';
import 'package:movie_app/error/failure.dart';
import 'package:movie_app/movies/domain/entities/movie.dart';
import 'package:movie_app/movies/domain/repository/base_movie_repository.dart';

class GetTopRatedUseCase {
  BaseMovieRepository baseMovieRepository;
  GetTopRatedUseCase({
    required this.baseMovieRepository,
  });
  //execute is an optional name to the method in use case
  Future<Either<Failure, List<Movie>>> execute() async {
    return await baseMovieRepository.getTopRatedMovies();
  }
}
