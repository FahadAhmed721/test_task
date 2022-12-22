import 'package:test_task/Repo/api_provider.dart';
import 'package:test_task/model/items.dart';

class ApiRepository {
  final _provider = ApiProvider();

  Future<List<Item>> fetchItemList() {
    return _provider.fetchItemList();
  }
}

class NetworkError extends Error {}
