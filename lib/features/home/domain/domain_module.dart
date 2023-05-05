import 'package:task/features/home/domain/usecase/home_usecase.dart';
import 'package:task/features/home/data/data_module.dart';
import 'package:riverpod/riverpod.dart';

final getTodoListUseCaseProvider =
    Provider<HomeUseCase>((ref) => HomeUseCase(ref.watch(todosRepositoryProvider)));
