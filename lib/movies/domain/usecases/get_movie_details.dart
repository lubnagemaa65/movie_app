import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:movie_app/core/useCase/base_useCase.dart';
import 'package:movie_app/error/failure.dart';
import 'package:movie_app/movies/domain/entities/movie_details.dart';
import 'package:movie_app/movies/domain/repository/base_movie_repository.dart';

//because in moviedetails i need the movie id
class GetMovieDetailsUseCase
    extends BaseUseCase<MovieDetail, MoviesDetailsParameters> {
  late BaseMovieRepository baseMovieRepository;
  @override
  Future<Either<Failure, MovieDetail>> call(
      MoviesDetailsParameters parameters) async {
    return await baseMovieRepository.getMovieDetails(parameters);
  }
} //we can add any parameter below

class MoviesDetailsParameters extends Equatable {
  final int movieId;
  const MoviesDetailsParameters({
    required this.movieId,
  });

  @override
  List<Object> get props => [movieId];
}
