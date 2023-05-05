import 'package:task/features/home/data/data_source/home_remote_data_source.dart';
import 'package:task/features/home/domain/repository/home_repository.dart';
import 'package:task/core/constants/app_network_constants.dart';
import 'package:task/core/errors/http/http_error.dart';
import 'package:task/core/errors/domain_error.dart';
import 'package:task/core/errors/failure.dart';
import 'package:either_dart/src/either.dart';

class HomeRepositoryImpl implements HomeRepository {
  HomeRemoteDataSource homeRemoteDataSource;

  HomeRepositoryImpl(this.homeRemoteDataSource);

  @override
  Future<Either<Failure, dynamic>> getUser() async {
    try {
      final uri = Uri.parse(AppNetworkConstants.usersURL);
      return homeRemoteDataSource.getUsers(uri);
    } on HttpError catch (e) {
      return Left(ServerFailure(message: e.message));
    } on DomainError catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }
}
