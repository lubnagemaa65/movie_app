import 'package:movie_app/core/network/error_msg_model.dart';

//in this file instead of return null data we throw an exception
class ServerException implements Exception {
  final ErrorMsgModel errorMsgModel;
  ServerException({
    required this.errorMsgModel,
  });
}

//if we want to work with local data source we can add:
class LocalDataBaseException implements Exception {
  final String message;
  LocalDataBaseException({
    required this.message,
  });
}
