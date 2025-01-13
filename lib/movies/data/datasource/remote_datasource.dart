import 'package:movie_app/core/network/api_constance.dart';
import 'package:movie_app/core/network/error_msg_model.dart';
import 'package:movie_app/error/exception.dart';
import 'package:movie_app/movies/data/models/movie_details_model.dart';
import 'package:movie_app/movies/data/models/movies_model.dart';
import 'package:movie_app/movies/data/models/recommendationModel.dart';
import 'package:movie_app/movies/domain/usecases/get_movie_details.dart';
import 'package:movie_app/movies/domain/usecases/get_recommendation.dart';
import 'package:dio/dio.dart';

abstract class BaseMovieRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovies();
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopRatedMovies();
  Future<MovieDetailsModel> getMovieDetails(MoviesDetailsParameters parameters);
  Future<List<Recommendationmodel>> getRecommendation(
      RecommendationParameter parameters);
}

class MovieRemoteDataSource extends BaseMovieRemoteDataSource {
  // we will call the use cases here using dio or http *dio here
  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    final response = await Dio().get(ApiConstance.nowPlayingMoviePath);
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data["results"] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      //we throw a model not just an error msg.
      throw ServerException(
          errorMsgModel: ErrorMsgModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final response = await Dio().get(ApiConstance.popularMoviesPath);

    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data["results"] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      //we throw a model not just an error msg.
      throw ServerException(
          errorMsgModel: ErrorMsgModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    final response = await Dio().get(ApiConstance.topRatedMoviesPath);

    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data["results"] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      //we throw a model not just an error msg.
      throw ServerException(
          errorMsgModel: ErrorMsgModel.fromJson(response.data));
    }
  }

  @override
  Future<MovieDetailsModel> getMovieDetails(parameters) async {
    final response =
        await Dio().get(ApiConstance.movieDetailsPath(parameters.movieId));

    if (response.statusCode == 200) {
      return MovieDetailsModel.fromJson(response.data["results"]);
    } else {
      //we throw a model not just an error msg.
      throw ServerException(
          errorMsgModel: ErrorMsgModel.fromJson(response.data));
    }
  }

  @override
  Future<List<Recommendationmodel>> getRecommendation(
      RecommendationParameter parameters) async {
    final response =
        await Dio().get(ApiConstance.recommendationPath(parameters.id));

    if (response.statusCode == 200) {
      return List<Recommendationmodel>.from((response.data["results"] as List)
          .map((e) => Recommendationmodel.fromJson(e)));
    } else {
      //we throw a model not just an error msg.
      throw ServerException(
          errorMsgModel: ErrorMsgModel.fromJson(response.data));
    }
  }
}
