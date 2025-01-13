import 'package:movie_app/movies/domain/entities/recommendation.dart';

class Recommendationmodel extends Recommendation {
  const Recommendationmodel({super.backdropPath, required super.id});

  factory Recommendationmodel.fromJson(Map<String, dynamic> json) =>
      Recommendationmodel(
          backdropPath:
              json['backdropPath'] ?? '/ta17TltHGdZ5PZz6oUD3N5BRurb.jpg',
          id: json['id']);
}
