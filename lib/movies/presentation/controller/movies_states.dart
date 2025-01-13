import 'package:equatable/equatable.dart';
import 'package:movie_app/core/utils/enums.dart';
import 'package:movie_app/movies/domain/entities/movie.dart';

class MoviesStates extends Equatable {
  // Fetch data
  final List<Movie> nowPlayingMovies;
  // Request state using enum
  final RequestState nowPlayingState;
  final String nowPlayingMessage;

  // Fetch data
  final List<Movie> popularMovies;
  // Request state using enum
  final RequestState popularState;
  final String popularMessage;

  // Fetch data
  final List<Movie> topRatedMovies;
  // Request state using enum
  final RequestState topRatedMoviesState;
  final String topRatedMoviesMessages;

  const MoviesStates({
    this.popularMovies = const [],
    this.popularState = RequestState.Loading,
    this.popularMessage = "",
    this.topRatedMovies = const [],
    this.topRatedMoviesState = RequestState.Loading,
    this.topRatedMoviesMessages = "",
    this.nowPlayingMovies = const [],
    this.nowPlayingState = RequestState.Loading,
    this.nowPlayingMessage = "",
  });
  MoviesStates copyWith({
    // we used copywith with MovieState in case  once  we create an object from moviestate if it is null take the old value else the new value.
    //so the is no null value for any list.
    List<Movie>? nowPlayingMovies,
    RequestState? nowPlayingState,
    String? nowPlayingMessage,
    List<Movie>? popularMovies,
    RequestState? popularState,
    String? popularMessage,
    List<Movie>? topRatedMovies,
    RequestState? topRatedMoviesState,
    String? topRatedMoviesMessages,
  }) {
    return MoviesStates(
      nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
      nowPlayingState: nowPlayingState ?? this.nowPlayingState,
      nowPlayingMessage: nowPlayingMessage ?? this.nowPlayingMessage,
      popularMovies: popularMovies ?? this.popularMovies,
      popularState: popularState ?? this.popularState,
      popularMessage: popularMessage ?? this.popularMessage,
      topRatedMovies: topRatedMovies ?? this.topRatedMovies,
      topRatedMoviesState: topRatedMoviesState ?? this.topRatedMoviesState,
      topRatedMoviesMessages:
          topRatedMoviesMessages ?? this.topRatedMoviesMessages,
    );
  }

  @override
  List<Object?> get props => [
        nowPlayingMovies,
        nowPlayingState,
        nowPlayingMessage,
        popularMovies,
        popularState,
        popularMessage,
        topRatedMovies,
        topRatedMoviesState,
        topRatedMoviesMessages,
      ];
}
