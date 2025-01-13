import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/error/failure.dart';

abstract class BaseUseCase<T, Parameters> {
  // call the callable method
  //get more info about callable classes
  Future<Either<Failure, T>> call(Parameters parameters);
}

//in case of the method had no parameters
class NoParamrters extends Equatable {
  const NoParamrters();
  @override
  List<Object?> get props => [];
}
