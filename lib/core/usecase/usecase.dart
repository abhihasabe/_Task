import 'package:task/core/errors/failure.dart';
import 'package:equatable/equatable.dart';
import 'package:either_dart/either.dart';

abstract class UseCaseNoInput<Output> {
  Future<Either<Failure, Output>> invoke();
}

abstract class UseCaseOneInput<Input, Output> {
  Future<Either<Failure, Output>> invoke(Input params);
}

abstract class UseCaseTwoInput<key, value, Output> {
  Future<Either<Failure, Output>> invoke(key params, value params2);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
