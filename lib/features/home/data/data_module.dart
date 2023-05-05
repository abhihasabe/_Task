import 'package:task/features/home/data/data_source/home_remote_data_source.dart';
import 'package:task/features/home/data/repository/home_repository_impl.dart';
import 'package:task/features/home/domain/repository/home_repository.dart';
import 'package:task/core/manager/http_client_manager.dart';
import 'package:riverpod/riverpod.dart';
import 'package:http/http.dart' as http;

final httpClientProvider = Provider<HttpClientManager>(
        (_) => HttpClientManagerImpl(initClient: http.Client()));

final homeRemoteDataSourceProvider =
    Provider<HomeRemoteDataSource>((ref) => HomeRemoteDataSourceImpl(ref.watch(httpClientProvider)));

final todosRepositoryProvider = Provider<HomeRepository>(
    (ref) => HomeRepositoryImpl(ref.watch(homeRemoteDataSourceProvider)));


