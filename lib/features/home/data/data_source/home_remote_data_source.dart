import 'package:task/core/constants/app_network_constants.dart';
import 'package:task/core/manager/http_client_manager.dart';
import 'package:task/core/errors/http/http_error.dart';
import 'package:task/core/errors/domain_error.dart';
import 'package:task/core/errors/failure.dart';
import 'package:either_dart/either.dart';

abstract class HomeRemoteDataSource {
  Future<Either<Failure, dynamic>> getUsers(Uri uri);
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  HttpClientManager httpClientManager;

  HomeRemoteDataSourceImpl(this.httpClientManager);

  @override
  Future<Either<Failure, dynamic>> getUsers(Uri url) async {
    try {
      final loginResp = await httpClientManager.request(url: url, method: AppNetworkConstants.get);
      if (loginResp != null) {
        return Right(loginResp);
      } else {
        return Left(ServerFailure(message: 'Data Not Found'));
      }
    } on HttpError catch (e) {
      return Left(ServerFailure(message: e.message));
    } on DomainError catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }
}
