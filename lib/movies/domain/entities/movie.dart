import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Movie extends Equatable {
  
   String backdropPath;
   int id;
  List<int> genresID;

    String overview;
    double popularity;
    String releaseDate;
    String title;
  double voteAverage;

   Movie(
      {required this.backdropPath,
      required this.id,
      required this.genresID,
      required this.overview,
      required this.popularity,
      required this.releaseDate,
      required this.title,
      required this.voteAverage});

  Movie.fromJson(Map<String, dynamic> json, this.backdropPath, this.id, this.genresID,this.overview, this.popularity, this.releaseDate, this.title, this.voteAverage) {
    backdropPath = json['backdrop_path'];
    id = json['id'];
    overview = json['overview'];
    popularity = json['popularity'];
    releaseDate = json['release_date'];
    title = json['title'];
    voteAverage = json['vote_average'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['backdrop_path'] = this.backdropPath;
    data['id'] = this.id;
    data['overview'] = this.overview;
    data['popularity'] = this.popularity;
    data['release_date'] = this.releaseDate;
    data['title'] = this.title;
    data['vote_average'] = this.voteAverage;
    return data;
  }
  
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
