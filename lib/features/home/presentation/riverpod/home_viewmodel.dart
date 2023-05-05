import 'package:task/features/home/presentation/riverpod/home_state.dart';
import 'package:task/features/home/domain/usecase/home_usecase.dart';
import 'package:task/features/home/data/model/home_model.dart';
import 'package:task/features/home/domain/domain_module.dart';
import 'package:riverpod/riverpod.dart';

final listProvider = Provider.autoDispose<HomeState<HomeModel>>((ref) {
  final todoListState = ref.watch(listViewModelStateNotifierProvider);

  return todoListState.when(
    init: () => const HomeState.init(),
    success: (todoList) => HomeState.success(todoList),
    loading: () => const HomeState.loading(),
    error: (exception) => HomeState.error(exception),
  );
});

final listViewModelStateNotifierProvider =
    StateNotifierProvider.autoDispose<ListViewModel, HomeState<HomeModel>>(
        (ref) {
  return ListViewModel(
    ref.watch(getTodoListUseCaseProvider),
  );
});

class ListViewModel extends StateNotifier<HomeState<HomeModel>> {
  final HomeUseCase _getTodoListUseCase;

  ListViewModel(this._getTodoListUseCase) : super(const HomeState.init()) {
    _getList();
  }

  _getList() async {
    try {
      state = const HomeState.loading();
      final todoList = await _getTodoListUseCase.invoke();
      if (todoList.isRight) {
        HomeModel homeModel = HomeModel.fromJson(todoList.right);
        state = HomeState.success(homeModel);
      } else {
        state = HomeState.error(Exception("Data Not Found"));
      }
    } on Exception catch (e) {
      state = HomeState.error(e);
    }
  }
}
