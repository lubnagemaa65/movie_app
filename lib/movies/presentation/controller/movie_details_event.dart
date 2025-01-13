import 'package:equatable/equatable.dart';

abstract class MovieDetailsEvent extends Equatable {
  const MovieDetailsEvent();
  //we have 2 events (more like this(recommendation),movie details)
}

class GetMovieDetailsEvent extends MovieDetailsEvent {
  final int id;
  const GetMovieDetailsEvent({
    required this.id,
  });

  @override
  List<Object?> get props => [id];
}

class GetMovieRecommendationEvent extends MovieDetailsEvent {
  final int id;
  const GetMovieRecommendationEvent({
    required this.id,
  });

  @override
  List<Object?> get props => [id];
}
