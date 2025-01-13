import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:movie_app/core/useCase/base_useCase.dart';
import 'package:movie_app/error/failure.dart';
import 'package:movie_app/movies/domain/entities/recommendation.dart';
import 'package:movie_app/movies/domain/repository/base_movie_repository.dart';

class GetRecommendationUseCase
    extends BaseUseCase<List<Recommendation>, RecommendationParameter> {
  final BaseMovieRepository baseMovieRepository;
  GetRecommendationUseCase(this.baseMovieRepository);
  @override
  Future<Either<Failure, List<Recommendation>>> call(
      RecommendationParameter parameters) async {
    return await baseMovieRepository.getRecommendation(parameters);
  }
}

class RecommendationParameter extends Equatable {
  final int id;
  const RecommendationParameter({
    required this.id,
  });

  @override
  List<Object> get props => [id];
}
