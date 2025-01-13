import 'package:equatable/equatable.dart';
import 'package:movie_app/core/utils/enums.dart';
import 'package:movie_app/movies/domain/entities/movie_details.dart';
import 'package:movie_app/movies/domain/entities/recommendation.dart';

abstract class MovieDetailsState extends Equatable {
  const MovieDetailsState(
      this.movieDetail, this.movieDetailsState, this.message,
      {this.recommendation = const [],
      this.recommendationState = RequestState.Loading,
      this.recommendationMessage = ""});

  final MovieDetail? movieDetail;
  final RequestState? movieDetailsState;
  final String? message;
  final List<Recommendation> recommendation;
  final RequestState recommendationState;
  final String? recommendationMessage;

  MovieDetailsState copyWith({
    MovieDetail? movieDetail,
    RequestState? movieDetailsState,
    String? message,
    List<Recommendation>? recommendation,
    RequestState? recommendationState,
    String? recommendationMessage,
  });

  @override
  List<Object?> get props => [
        movieDetail,
        message,
        movieDetailsState,
        recommendation,
        recommendationState,
        recommendationMessage
      ];
}

class MovieDetailsInitial extends MovieDetailsState {
  const MovieDetailsInitial(
      super.movieDetail, super.movieDetailsState, super.message,
      {super.recommendation,
      super.recommendationState,
      super.recommendationMessage});

  @override
  MovieDetailsState copyWith({
    MovieDetail? movieDetail,
    RequestState? movieDetailsState,
    String? message,
    List<Recommendation>? recommendation,
    RequestState? recommendationState,
    String? recommendationMessage,
  }) {
    return MovieDetailsInitial(
      movieDetail ?? this.movieDetail,
      movieDetailsState ?? this.movieDetailsState,
      message ?? this.message,
      recommendation: recommendation ?? this.recommendation,
      recommendationState: recommendationState ?? this.recommendationState,
      recommendationMessage:
          recommendationMessage ?? this.recommendationMessage,
    );
  }
}
