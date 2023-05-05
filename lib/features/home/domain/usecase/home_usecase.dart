import 'package:task/features/home/domain/repository/home_repository.dart';
import 'package:task/core/usecase/usecase.dart';
import 'package:task/core/errors/failure.dart';
import 'package:either_dart/src/either.dart';

class HomeUseCase implements UseCaseNoInput<dynamic> {
  HomeRepository repository;

  HomeUseCase(this.repository);

  @override
  Future<Either<Failure, dynamic>> invoke() async {
    return await repository.getUser();
  }
}
