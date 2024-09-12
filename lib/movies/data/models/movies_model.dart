
// ignore_for_file: must_be_immutable

import 'package:flutter/foundation.dart';

import '../../domain/entities/movie.dart';

class MoviesModel extends Movie{
  MoviesModel({
    required super.backdropPath, 
    required super.id,
     required super.overview, 
     required super.popularity, 
     required super.releaseDate, 
     required super.title, 
     required super.voteAverage, required super.genresID});

factory MoviesModel.fromJson(Map<String,dynamic>json)=> MoviesModel(
  backdropPath: json['backdropPath'],
   id: json['id'] ,
   overview:json['overview'],
    popularity:json['popularity'], 
    releaseDate: json['releaseDate'],
     title: json['title'],
      voteAverage: json['voteAverage'].toDouble(), 
      genresID: List<int>.from(json['genresID'].map((e) => e
      )));

  }
