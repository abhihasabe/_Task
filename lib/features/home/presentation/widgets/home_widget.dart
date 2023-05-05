import 'package:task/features/home/presentation/riverpod/home_viewmodel.dart';
import 'package:task/features/home/data/model/home_model.dart';
import 'package:task/core/manager/network_info_manager.dart';
import 'package:task/core/helper/toast_helper.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';

class HomeWidget extends ConsumerStatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends ConsumerState<HomeWidget> {
  dynamic searchValue = "";
  final TextEditingController _searchController = TextEditingController();
  List<HomeDataModel> duplicateItems = <HomeDataModel>[];
  List<HomeDataModel> items = <HomeDataModel>[];
  List<HomeDataModel> filterItems = <HomeDataModel>[];

  @override
  Widget build(BuildContext context) {
    var connectivityStatusProvider = ref.watch(connectivityStatusProviders);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0xff690435), Color(0xff73053c)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size(0, 60),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(12, 0, 12, 10),
            child: Container(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                    colors: [Colors.white60, Colors.white70],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: TextField(
                  textAlign: TextAlign.left,
                  onChanged: (value) {
                    setState(() {
                      searchValue = value;
                    });
                    if (connectivityStatusProvider ==
                        ConnectivityStatus.isConnected) {
                      _filterListData(value);
                    } else {
                      Toast("Please check InterNet Connection");
                    }
                  },
                  controller: _searchController,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      errorBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      contentPadding: EdgeInsets.all(0),
                      hintText: 'Search'),
                ),
              ),
            ),
          ),
        ),
      ),
      body: connectivityStatusProvider == ConnectivityStatus.isConnected
          ? Consumer(
              builder: (context, ref, _) {
                return ref.watch(listProvider).maybeWhen(
                      success: (content) {
                        items = content.data!;
                        return _buildTodoListWidget(ref, content);
                      },
                      error: (_) => const Text("Error"),
                      orElse: () =>
                          const Center(child: CircularProgressIndicator()),
                    );
              },
            )
          : const Center(
              child: Text(
              "Please check Internet Connection",
              style: TextStyle(fontSize: 18),
            )),
    );
  }

  void _filterListData(String enteredKeyword) {
    if (enteredKeyword.isEmpty) {
      items = items;
    } else {
      items = items
          .where((user) => user.firstName!
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      filterItems.clear();
      filterItems = items;
    });
  }

  Widget _buildTodoListWidget(final WidgetRef ref, final HomeModel homeModel) {
    if (homeModel.data!.isEmpty) {
      return const Center(child: Text('Data Not Found'));
    } else {
      return searchValue.toString().isEmpty
          ? ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: items.length,
              shrinkWrap: true,
              itemBuilder: (final BuildContext context, final int index) {
                return _buildTodoItemCardWidget(context, ref, items[index]);
              },
            )
          : ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: filterItems.length,
              shrinkWrap: true,
              itemBuilder: (final BuildContext context, final int index) {
                return _buildTodoItemCardWidget(
                    context, ref, filterItems[index]);
              },
            );
    }
  }

  Widget _buildTodoItemCardWidget(
      final BuildContext context, final WidgetRef ref, HomeDataModel? todo) {
    return InkWell(
      child: Column(
        children: [
          Card(
            margin: EdgeInsets.zero,
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  leading: Image.network(todo!.avatar!),
                  title: Text(
                    todo.firstName!,
                    style: Theme.of(context).textTheme.headline6,
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: Text(
                    todo.lastName!,
                    style: Theme.of(context).textTheme.bodyText2,
                    overflow: TextOverflow.ellipsis,
                  ),
                )),
          ),
          const Divider(thickness: 0)
        ],
      ),
    );
  }
}
