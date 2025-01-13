import 'package:movie_app/movies/domain/entities/geners.dart';

class GeneresModel extends Geners {
  const GeneresModel({required super.name, required super.id});

  factory GeneresModel.fromJson(Map<String, dynamic> json) => GeneresModel(
        name: json['name'],
        id: json['id'],
      );
}
