import 'package:dartz/dartz.dart';
import 'package:movie_app/core/useCase/base_useCase.dart';
import 'package:movie_app/error/failure.dart';
import 'package:movie_app/movies/domain/entities/movie.dart';
import 'package:movie_app/movies/domain/repository/base_movie_repository.dart';

class GetPopularUseCase extends BaseUseCase<List<Movie>,NoParamrters> {
  BaseMovieRepository baseMovieRepository;
  GetPopularUseCase({
    required this.baseMovieRepository,
  });
  //execute is an optional name to the method in use case
 
  
  @override
  Future<Either<Failure, List<Movie>>> call(NoParamrters noParameters) async {
    return await baseMovieRepository.getPopularMovies();
  
  
  }
}
