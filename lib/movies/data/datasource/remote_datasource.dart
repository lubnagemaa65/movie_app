import 'package:movie_app/core/network/api_constance.dart';
import 'package:movie_app/core/network/error_msg_model.dart';
import 'package:movie_app/error/exception.dart';
import 'package:movie_app/movies/data/models/movies_model.dart';
import 'package:dio/dio.dart';

abstract class BaseMovieRemoteDataSource{
  Future <List<MoviesModel>> getNowPlayingMovies();
    Future<List<MoviesModel>> getPopularMovies();
  Future<List<MoviesModel>> getTopRatedMovies();

}
class MovieRemoteDataSource extends BaseMovieRemoteDataSource{
      // we will call the use cases here using dio or http *dio here
  @override
  Future<List<MoviesModel>> getNowPlayingMovies() async {
   
   final response= await Dio().get(ApiConstance.nowPlayingMoviePath);
   if(response.statusCode==200){
    return List<MoviesModel>.from((response.data["results"]as List).map((e)=>MoviesModel.fromJson(e)));
   }
   else{//we throw a model not just an error msg.
    throw ServerException(errorMsgModel: ErrorMsgModel.fromJson(response.data));
  }
}

  @override
  Future<List<MoviesModel>> getPopularMovies()async {
       final response= await Dio().get(ApiConstance.popularMoviesPath);

    if (response.statusCode == 200) {
      return List<MoviesModel>.from((response.data["results"] as List)
          .map((e) => MoviesModel.fromJson(e)));
    } else {
      //we throw a model not just an error msg.
      throw ServerException(
          errorMsgModel: ErrorMsgModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MoviesModel>> getTopRatedMovies()async {
  
      final response= await Dio().get(ApiConstance.topRatedMoviesPath);

    if (response.statusCode == 200) {
      return List<MoviesModel>.from((response.data["results"] as List)
          .map((e) => MoviesModel.fromJson(e)));
    } else {
      //we throw a model not just an error msg.
      throw ServerException(
          errorMsgModel: ErrorMsgModel.fromJson(response.data));
    }
  }
  }