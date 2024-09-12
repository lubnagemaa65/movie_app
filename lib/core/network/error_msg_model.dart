import 'package:equatable/equatable.dart';

class ErrorMsgModel extends Equatable {
  final int statusCode;
  final bool success;
  final String statusMessage; 
  const ErrorMsgModel({
    required this.statusCode,
    required this.success,
    required this.statusMessage,
  });
  factory ErrorMsgModel.fromJson(Map<String,dynamic> json){
    return ErrorMsgModel(
      statusCode: json["statusCode"], 
      success:json["success"], 
      statusMessage: json["statusMessage"]);
  }
  
  @override
  List<Object?> get props => [statusCode,statusMessage,success];
}
