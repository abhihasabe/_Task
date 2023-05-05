import 'package:freezed_annotation/freezed_annotation.dart';

part 'state.freezed.dart';

@freezed
class HomeState<T> with _$State<T> {
  const HomeState._();

  const factory HomeState.init() = _init<T>;
  const factory HomeState.loading() = _loading;
  const factory HomeState.success(final T data) = _success<T>;
  const factory HomeState.error(final Exception exception) = _error;

  bool get isInit => maybeWhen(init: () => true, orElse: () => false);

  bool get isLoading =>  maybeWhen(loading: () => true, orElse: () => false);

  bool get isSuccess => maybeMap(success: (_) => true, orElse: () => false);

  bool get isError => maybeWhen(error: (_) => true, orElse: () => false);

  T? get data => maybeWhen(success: (data) => data, orElse: () => null);
}
